defmodule WordLadder.MixProject do
  use Mix.Project

  def project do
    [
      app: :word_ladder,
      version: "0.1.0",
      elixir: "~> 1.17-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {WordLadder.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:combination, "~> 0.0.3"}
    ]
  end
end
