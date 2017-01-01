defmodule UsWeather.Http do
  @weather_url "http://w1.weather.gov/xml/current_obs"

  def fetch() do
    weather_url()
    |> HTTPoison.get
    |> handle_response
  end

  def weather_url() do
    # TODO make location an option
    "#{@weather_url}/KDTO.xml"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, body}
  end

  def handle_response({_, %{status_code: _status, body: body}}) do
    {:error, body}
  end
end
