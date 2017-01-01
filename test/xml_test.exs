defmodule XmlTest do
  use ExUnit.Case
  doctest UsWeather.Xml

  @valid_xml """
  <current_observation>
    <location>England</location>
    <weather>Raining</weather>
    <temp_c>5</temp_c>
    <other>other</other>
    <stuff>stuff</stuff>
  </current_observation>
  """

  test "it parses a location, weather and temperature from valid XML" do
    assert UsWeather.Xml.parse(@valid_xml) == [location: 'England', weather: 'Raining', temperature: "5 C"]
  end
end
