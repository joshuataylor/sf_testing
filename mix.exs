defmodule SfTesting.MixProject do
  use Mix.Project

  def project do
    [
      app: :sf_testing,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:explorer, github: "joshuataylor/explorer", branch: "feature/snowflake-test"},
      {:rustler, ">= 0.0.0", optional: true},
      {:benchee, "~> 1.1"}
    ]
  end
end
