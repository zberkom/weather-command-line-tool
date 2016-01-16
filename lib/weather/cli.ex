defmodule Weather.CLI do
  @moduledoc """
  This Module handles user input through the commandline
  """

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  'argv' can be -h or --help, which returns :help.

  Otherwise it is a 3-4 digit location/airport code.

  Return a tuple of `{ code }`, or `:help` if help was given.
  """

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help])
    case parse do
      { [help: true], _, _ }
        -> :help
      { _, [code], _}
        -> code
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: weather <airport/location code> Example: weather KPDX

    If you do not know your location code you can look it up here: http://w1.weather.gov/xml/current_obs
    """
    System.halt(0)
  end

  def process(code) do
    Weather.Fetcher.fetch(code)
  end
end
