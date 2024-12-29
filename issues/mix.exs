defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      version: "0.1.0",
      name: "GitHub Issues",
      elixir: "~> 1.18",
      source_url: "https://github.com/pennychase/ProgrammingElixir/issues",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: Issues.CLI]
    ]
  end
 
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      #{:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:httpoison, "~>2.0"},
      {:poison, "~> 6.0"},
      {:ex_doc, "~> 0.36.1"},
      {:earmark, "~> 1.4"}
    ]
  end


end
