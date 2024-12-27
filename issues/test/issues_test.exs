defmodule IssuesTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end 

  test "three values returned if three are given" do
    assert parse_args(["user", "project", 99]) == {"user", "project", 99}
  end 

  test "default value for count if two arguments are given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end 

end
