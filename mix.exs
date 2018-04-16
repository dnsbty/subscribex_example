defmodule SubscribexExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :rabbit_tester,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {SubscribexExample.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:subscribex, path: "../subscribex"}
    ]
  end
end
