defmodule Weather.Fetcher do
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText,    from_lib: "xmerl/include/xmerl.hrl")

  def fetch(code) do
    weather_url(code)
    |> HTTPoison.get
    |> parse_response
  end

  defp weather_url(code) do
    "http://w1.weather.gov/xml/current_obs/#{code}.xml"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: text}}) do
    text
    |> scan_text
    |> parse_xml
    |> print_result
  end

  defp scan_text(text) do
    :xmerl_scan.string(String.to_char_list(text))
  end

  defp parse_xml({ xml, _ }) do
    elements = Enum.map(metrics,
      fn(metric) ->
        :xmerl_xpath.string('/current_observation/' ++ metric, xml)
      end
    )

    values = Enum.map(elements,
      fn(element) ->
        [text] = xmlElement(List.first(element), :content)
        value  = to_char_list(xmlText(text, :value))
      end
    )

    format_response(pretty_metric_names, values)
  end

  defp print_result(response) do
    Enum.each(Enum.reverse(response), fn(x) -> IO.puts x end)
  end

  defp format_response([], [], response), do: response
  defp format_response([metric | mt], [value | vt], response \\ []) do
    response = [ metric ++ ': ' ++ value | response ]
    format_response(mt, vt, response)
  end

  defp metrics do
    ['location', 'observation_time', 'weather', 'temperature_string',
    'relative_humidity', 'wind_string', 'windchill_string']
  end

  defp pretty_metric_names do
    ['Location', 'Observation Time', 'Weather', 'Temperature',
    'Humidity', 'Wind', 'Wind-chill']
  end

end
