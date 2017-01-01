defmodule UsWeather.Http do
  @weather_url "http://w1.weather.gov/xml/current_obs"

  def fetch(location) do
    weather_url(location)
    |> HTTPoison.get
    |> handle_response
  end

  def weather_url(location) do
    "#{@weather_url}/#{String.upcase(location)}.xml"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  def handle_response({_, %{status_code: status, body: _body}}) do
    {:error, status}
  end
end
