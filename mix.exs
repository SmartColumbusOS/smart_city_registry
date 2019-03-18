defmodule SmartCity.Registry.MixProject do
  use Mix.Project

  def project do
    [
      app: :smart_city_registry,
      version: "2.0.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https//www.github.com/SmartColumbusOS"
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:smart_city, "~> 2.0", organization: "smartcolumbus_os"},
      {:jason, "~> 1.1"},
      {:ex_doc, "~> 0.19", only: :dev},
      {:credo, "~> 0.10", only: [:dev, :test], runtime: false},
      {:placebo, "~> 1.2", only: :test},
      {:mix_test_watch, "~> 0.9.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    "A library for Dataset, Organization modules in Smart City"
  end

  defp package do
    [
      organization: "smartcolumbus_os",
      licenses: ["AllRightsReserved"],
      links: %{"GitHub" => "https://www.github.com/SmartColumbusOS/smart_city_registry"}
    ]
  end
end
