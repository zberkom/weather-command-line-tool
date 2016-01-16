defmodule FetcherTest do
  use ExUnit.Case
  alias Weather.Fetcher

  def success_response do
    {:ok,
     %HTTPoison.Response{body: "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?> \r\n<?xml-stylesheet href=\"latest_ob.xsl\" type=\"text/xsl\"?>\r\n<current_observation version=\"1.0\"\r\n\t xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\r\n\t xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n\t xsi:noNamespaceSchemaLocation=\"http://www.weather.gov/view/current_observation.xsd\">\r\n\t<credit>NOAA's National Weather Service</credit>\r\n\t<credit_URL>http://weather.gov/</credit_URL>\r\n\t<image>\r\n\t\t<url>http://weather.gov/images/xml_logo.gif</url>\r\n\t\t<title>NOAA's National Weather Service</title>\r\n\t\t<link>http://weather.gov</link>\r\n\t</image>\r\n\t<suggested_pickup>15 minutes after the hour</suggested_pickup>\r\n\t<suggested_pickup_period>60</suggested_pickup_period>\n\t<location>Denton Municipal Airport, TX</location>\n\t<station_id>KDTO</station_id>\n\t<latitude>33.20505</latitude>\n\t<longitude>-97.20061</longitude>\n\t<observation_time>Last Updated on Jan 16 2016, 1:53 pm CST</observation_time>\r\n        <observation_time_rfc822>Sat, 16 Jan 2016 13:53:00 -0600</observation_time_rfc822>\n\t<weather>Light Rain</weather>\n\t<temperature_string>38.0 F (3.3 C)</temperature_string>\r\n\t<temp_f>38.0</temp_f>\r\n\t<temp_c>3.3</temp_c>\n\t<relative_humidity>89</relative_humidity>\n\t<wind_string>North at 12.7 MPH (11 KT)</wind_string>\n\t<wind_dir>North</wind_dir>\n\t<wind_degrees>10</wind_degrees>\n\t<wind_mph>12.7</wind_mph>\n\t<wind_kt>11</wind_kt>\n\t<pressure_string>1017.5 mb</pressure_string>\n\t<pressure_mb>1017.5</pressure_mb>\n\t<pressure_in>30.05</pressure_in>\n\t<dewpoint_string>35.1 F (1.7 C)</dewpoint_string>\r\n\t<dewpoint_f>35.1</dewpoint_f>\r\n\t<dewpoint_c>1.7</dewpoint_c>\n\t<windchill_string>30 F (-1 C)</windchill_string>\r\n      \t<windchill_f>30</windchill_f>\r\n      \t<windchill_c>-1</windchill_c>\n\t<visibility_mi>9.00</visibility_mi>\n \t<icon_url_base>http://forecast.weather.gov/images/wtf/small/</icon_url_base>\n\t<two_day_history_url>http://www.weather.gov/data/obhistory/KDTO.html</two_day_history_url>\n\t<icon_url_name>ra.png</icon_url_name>\n\t<ob_url>http://www.weather.gov/data/METAR/KDTO.1.txt</ob_url>\n\t<disclaimer_url>http://weather.gov/disclaimer.html</disclaimer_url>\r\n\t<copyright_url>http://weather.gov/disclaimer.html</copyright_url>\r\n\t<privacy_policy_url>http://weather.gov/notice.html</privacy_policy_url>\r\n</current_observation>\n",
      headers: [{"Server", "Apache/2.2.15 (Red Hat)"},
       {"X-NIDS-ServerID", "www8.md"},
       {"Last-Modified", "Sat, 16 Jan 2016 20:02:18 GMT"},
       {"Accept-Ranges", "bytes"}, {"Content-Length", "2270"},
       {"Content-Type", "application/xml"},
       {"Date", "Sat, 16 Jan 2016 20:43:25 GMT"}, {"Connection", "keep-alive"}],
      status_code: 200}
    }
  end

  test "fetch fetches the current weather forcast for given location code" do
    result = Fetcher.fetch("KDTO")
    assert result == :ok
  end
end
