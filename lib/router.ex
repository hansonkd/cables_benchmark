defmodule CablesBenchmark.Router do
    use Plug.Router

    plug :match
    plug :dispatch

    get "/:size" do
        {size, _} =
            Map.get(conn.params, "size", "1")
            |> Integer.parse

        return_string =
            Enum.map(1..size, fn i -> "hello world (#{i})\n" end)
            |> Enum.join()
        conn
        |> send_resp(200, return_string)
    end
    get "/headers/:size" do
        {size, _} =
            Map.get(conn.params, "size", "1")
            |> Integer.parse

        return_string =
            Enum.map(1..size, fn i -> "hello world (#{i})\n" end)
            |> Enum.join()

        conn
        |> merge_resp_headers([
            {"my-awesome-response-header", "1234567890123456789012345678901234567890"},
            # {"my-other-awesome-response-header", :crypto.strong_rand_bytes(128) |> Base.url_encode64},
        ])
        |> put_resp_content_type("text/plain")
        send_resp(conn, 200, return_string)
    end
end