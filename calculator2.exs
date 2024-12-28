defmodule Calculator do

  def calculate(str) do
    str
      |> parse
      |> evaluate
  end
  
  def parse(str) do
    str
      |> String.to_charlist
      |> parse_bitstring
      |> evaluate
  end

  def parse_bitstring(str) do
    {arg1, rest} = Enum.split_while(str, &is_digit(&1))
    [ op | rest ] = Enum.drop_while(rest, fn x -> x == ?\s end)
    arg2 = Enum.drop_while(rest, fn x -> x == ?\s end)
    { to_integer(arg1), op, to_integer(arg2) }
  end

  def is_digit(ch), do: ch in ~c"0123456789"

  def is_op(ch), do: ch in ~c"+-*/"

  def to_integer(digits), do: List.foldl(digits, 0, fn x, acc -> (10 * acc) + (x - ?0) end)

  def evaluate(expr) do
    case expr do
      {arg1, ?+, arg2} -> arg1 + arg2
      {arg1, ?-, arg2} -> arg1 - arg2
      {arg1, ?*, arg2} -> arg1 * arg2
      {arg1, ?/, arg2} -> arg1 / arg2
      _ -> expr
    end
  end
end