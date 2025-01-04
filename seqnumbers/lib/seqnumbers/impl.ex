defmodule Seqnumbers.Impl do

  def next(number), do: number + 1

  def increment(number, delta), do: number + delta

  def set(number), do: number
end