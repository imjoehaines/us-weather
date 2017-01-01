defmodule UsWeather.Cli do
  def main(argv) do
    argv
    # TODO make location an option
     # |> parse_args
     |> process
  end

  def process([]) do
    UsWeather.Http.fetch()
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
