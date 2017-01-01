defmodule UsWeather.Xml do
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  def parse(xml_string) do
    {xml, _} = :xmerl_scan.string(String.to_char_list(xml_string))

    [element]  = :xmerl_xpath.string('/current_observation/location', xml)
    [text] = xmlElement(element, :content)
    location = xmlText(text, :value)

    [element]  = :xmerl_xpath.string('/current_observation/weather', xml)
    [text] = xmlElement(element, :content)
    weather = xmlText(text, :value)

    [element]  = :xmerl_xpath.string('/current_observation/temp_c', xml)
    [text] = xmlElement(element, :content)
    temperature = "#{xmlText(text, :value)} C"

    [location: location, weather: weather, temperature: temperature]
  end
end
