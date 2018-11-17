num_requests = 10_000

{:ok, pool_1_50} = Cables.new_pool("https://localhost:4001", :http2_1_50)
{:ok, pool_50_1} = Cables.new_pool("https://localhost:4001", :http2_50_1)
{:ok, pool_5_10} = Cables.new_pool("https://localhost:4001", :http2_5_10)
{:ok, pool_10_5} = Cables.new_pool("https://localhost:4001", :http2_10_5)
{:ok, pool_2_25} = Cables.new_pool("https://localhost:4001", :http2_2_25)
{:ok, pool_10_100} = Cables.new_pool("https://localhost:4001", :http2_10_100)
{:ok, pool_100_100} = Cables.new_pool("https://localhost:4001", :http2_100_100)
{:ok, pool_100_1} = Cables.new_pool("https://localhost:4001", :http2_100_1)
{:ok, pool_1_1} = Cables.new_pool("https://localhost:4001", :http2_1_1)

cables_bench_with_profile = fn pool, size ->
    fn ->
      for _ <- 1..num_requests do
        Task.async(fn ->
          {:ok, %Cables.Response{status: 200}} = Cables.get(pool, "/#{size}")
        end)
      end |> Task.yield_many(10000)
    end
end

cables_bench_with_profile_headers = fn pool, size ->
    fn ->
      for _ <- 1..num_requests do
        Task.async(fn ->
          {:ok, %Cables.Response{status: 200}} = Cables.get(pool, "/headers/#{size}", [{"content-type", "text/plain"}, {"awesome-request-header", "12345690-12345690-12345690-12345690"}])
        end)
      end |> Task.yield_many(10000)
    end
end

:ok = :hackney_pool.start_pool(:hackney_pool_1, [timeout: 60_000, max_connections: 1])
:ok = :hackney_pool.start_pool(:hackney_pool_50, [timeout: 60_000, max_connections: 50])
:ok = :hackney_pool.start_pool(:hackney_pool_100, [timeout: 60_000, max_connections: 100])

hackney_bench = fn pool_name, size ->
    fn ->
        for _ <- 1..num_requests do
            Task.async(fn ->
                %HTTPoison.Response{status_code: 200} = HTTPoison.get!("https://localhost:4001/#{size}", [], hackney: [checkout_timeout: 60_000, pool: pool_name], ssl: [keyfile: "priv/server.key", certfile: "priv/server.pem"])
            end)
        end |> Task.yield_many(10000)
    end
end


hackney_bench_headers = fn pool_name, size ->
    fn ->
        for _ <- 1..num_requests do
            Task.async(fn ->
                %HTTPoison.Response{status_code: 200} = HTTPoison.get!("https://localhost:4001/headers/#{size}", [{"content-type", "text/plain"}, {"awesome-request-header", "12345690-12345690-12345690-12345690"}], hackney: [checkout_timeout: 60_000, pool: pool_name], ssl: [keyfile: "priv/server.key", certfile: "priv/server.pem"])
            end)
        end |> Task.yield_many(10000)
    end
end

for size <- [1, 100, 1_000] do
    IO.puts("\n\nRunning Benchmark with size (#{size})\n\n")
    Benchee.run(%{
      "Cables:   1 connection 50 streams"    => cables_bench_with_profile.(pool_1_50, size),
      "Cables:  50 connections 1 streams"    => cables_bench_with_profile.(pool_50_1, size),
      "Cables:   5 connections 10 streams"    => cables_bench_with_profile.(pool_5_10, size),
      "Cables:  10 connections 5 streams"    => cables_bench_with_profile.(pool_10_5, size),
      "Cables:   2 connections 25 streams"    => cables_bench_with_profile.(pool_2_25, size),
      "Cables:  10 connections 100 streams"    => cables_bench_with_profile.(pool_10_100, size),
      "Cables: 100 connections 100 streams"    => cables_bench_with_profile.(pool_100_100, size),
      "Cables: 100 connections   1 stream"    => cables_bench_with_profile.(pool_100_1, size),
      "Cables:   1 connection 1 stream"    => cables_bench_with_profile.(pool_1_1, size),

      "Hackney:   1 connection" => hackney_bench.(:hackney_pool_1, size),
      "Hackney:  50 connection" => hackney_bench.(:hackney_pool_50, size),
      "Hackney: 100 connection" => hackney_bench.(:hackney_pool_100, size),

    }, time: 10, formatters: [
        Benchee.Formatters.HTML,
        Benchee.Formatters.Console
    ],
    formatter_options: [html: [file: "output/no_headers_#{size}.html"]])

    IO.puts("\n\nRunning Headers Benchmark with size (#{size})\n\n")
    Benchee.run(%{
      "Cables (Headers):   1 connection 50 streams"    => cables_bench_with_profile_headers.(pool_1_50, size),
      "Cables (Headers):  50 connections 1 streams"    => cables_bench_with_profile_headers.(pool_50_1, size),
      "Cables (Headers):   5 connections 10 streams"    => cables_bench_with_profile_headers.(pool_5_10, size),
      "Cables (Headers):  10 connections 5 streams"    => cables_bench_with_profile_headers.(pool_10_5, size),
      "Cables (Headers):   2 connections 25 streams"    => cables_bench_with_profile_headers.(pool_2_25, size),
      "Cables (Headers):  10 connections 100 streams"    => cables_bench_with_profile_headers.(pool_10_100, size),
      "Cables (Headers): 100 connections 100 streams"    => cables_bench_with_profile_headers.(pool_100_100, size),
      "Cables (Headers): 100 connections 1 stream"    => cables_bench_with_profile_headers.(pool_100_1, size),
      "Cables (Headers):   1 connection 1 stream"    => cables_bench_with_profile_headers.(pool_1_1, size),

      "Hackney (Headers):   1 connection" => hackney_bench_headers.(:hackney_pool_1, size),
      "Hackney (Headers):  50 connection" => hackney_bench_headers.(:hackney_pool_50, size),
      "Hackney (Headers): 100 connection" => hackney_bench_headers.(:hackney_pool_100, size),
    }, time: 10, formatters: [
        Benchee.Formatters.HTML,
        Benchee.Formatters.Console
    ],
    formatter_options: [html: [file: "output/headers_#{size}.html"]])
end