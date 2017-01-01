defmodule UsWeather.Cli do
  def main(argv) do
    argv
     |> parse_args
     |> process
  end

  def parse_args([]), do: :help

  def parse_args(argv) do
    parse = OptionParser.parse(
      argv,
      switches: [help: :boolean],
      aliases: [h: :help]
    )

    case parse do
      {[help: true], _, _} -> :help
      {_, [location], _} -> location
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    US Weather
    Fetches the weather from the US National Weather Service

    The given location should be a 4 digit code from one of the state lists, e.g.
    "PADK" would lookup the weather for Adak Island, Adak Airport

    See http://w1.weather.gov/xml/current_obs/seek.php

    usage: us_weather <location>
    """

    System.halt(0)
  end

  def process(location) do
    UsWeather.Http.fetch(location)
    |> decode_response
    |> output
  end

  def decode_response({:ok, body}) do
    UsWeather.Xml.parse(body)
  end

  def decode_response({_, error}) do
    IO.puts "Error fetching weather data: #{error}"
    System.halt(2)
  end

  def output([location: location, weather: weather, temperature: temperature]) do
    IO.puts location
    IO.puts "#{weather} (#{temperature})"
  end
end
