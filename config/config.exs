# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :cables_benchmark, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:cables_benchmark, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"

config :cables,
  profiles: [
    http2_50_1: [
      max_connections: 50,
      max_streams: 1,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_1_50: [
      max_connections: 1,
      max_streams: 50,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_10_5: [
      max_connections: 10,
      max_streams: 5,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_5_10: [
      max_connections: 5,
      max_streams: 10,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_2_25: [
      max_connections: 2,
      max_streams: 25,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_10_100: [
      max_connections: 10,
      max_streams: 100,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_100_100: [
      max_connections: 100,
      max_streams: 100,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_100_1: [
      max_connections: 100,
      max_streams: 1,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
    http2_1_1: [
      max_connections: 1,
      max_streams: 1,
      pool_timeout: 60_000,
      connection_timeout: 60_000
    ],
  ]
