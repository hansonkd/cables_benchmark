defmodule CablesBenchmark.MixProject do
  use Mix.Project

  def project do
    [
      app: :cables_benchmark,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {CablesBenchmark, []},
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cables, "~> 0.2.0"},
      {:httpoison, "~> 1.4"},

      {:plug_cowboy, "~> 2.0"},
      {:benchee, "~> 0.10.0"},
      {:benchee_html, "~> 0.4"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
