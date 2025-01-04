defmodule SeqnumbersTest do
  use ExUnit.Case
  doctest Seqnumbers

  test "greets the world" do
    assert Seqnumbers.hello() == :world
  end
end
