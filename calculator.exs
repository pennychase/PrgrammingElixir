defmodule Calculator do

  def calculate(str) do
    str
      |> parse
      |> evaluate
  end
  
  def parse(str) do
    m = Regex.named_captures(~r/(?<arg1>\d+)\s+(?<op>[\+\*\-\/])\s+(?<arg2>\d+)/, str)
    { String.to_integer(m["arg1"]), m["op"], String.to_integer(m["arg2"]) }
  end

  def evaluate(expr) do
    case expr do
      {arg1, "+", arg2} -> arg1 + arg2
      {arg1, "-", arg2} -> arg1 - arg2
      {arg1, "*", arg2} -> arg1 * arg2
      {arg1, "/", arg2} -> arg1 / arg2
    end
  end
end