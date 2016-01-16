defmodule CliTest do
  use ExUnit.Case

  import Weather.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "code is returned if only code is given" do
    assert parse_args(["code"]) == "code"
  end

end
