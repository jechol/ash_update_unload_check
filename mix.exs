defmodule AshUpdateUnloadCheck.MixProject do
  use Mix.Project

  def project do
    [
      app: :ash_update_unload_check,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :dev,
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {AshUpdateUnloadCheck.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sourceror, "~> 1.7", only: [:dev, :test]},
      {:ash_state_machine, ">= 0.0.0"},
      {:ash_paper_trail, ">= 0.0.0"},
      {:ash_archival, ">= 0.0.0"},
      {:ash, github: "ash-project/ash", branch: "main", override: true},
      {:ash_postgres, github: "ash-project/ash_postgres", branch: "main", override: true},
      {:igniter, ">= 0.0.0", only: [:dev, :test]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases() do
    [test: ["ash.setup --quiet", "test"], setup: "ash.setup"]
  end

  defp elixirc_paths(:test),
    do: elixirc_paths(:dev) ++ ["test/support"]

  defp elixirc_paths(_),
    do: ["lib"]
end
