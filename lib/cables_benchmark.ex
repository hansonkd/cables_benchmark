defmodule CablesBenchmark do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(scheme: :https, plug: CablesBenchmark.Router, options: [transport_options: [num_acceptors: 10_000, max_connections: :infinity], port: 4001, otp_app: :cables_benchmark, keyfile: "priv/server.key", certfile: "priv/server.pem"])
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end