defmodule UsWeather.Mixfile do
  use Mix.Project

  def project do
    [app: :us_weather,
     version: "0.1.0",
     name: "US Weather",
     source_url: "https://github.com/imjoehaines/us-weather",
     escript: escript_config(),
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.10.0"}]
  end

  defp escript_config do
    [main_module: UsWeather.Cli]
  end
end
