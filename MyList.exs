defmodule MyList do

    def map([], _func), do: []
    def map([head|tail], func) do
      [func.(head) | map(tail, func)]
    end

    def reduce([],val,_func), do: val
    def reduce([head|tail],val,func) do
      reduce(tail, func.(head, val), func)
    end

    def sum(nums), do: reduce(nums, 0, &(&1 + &2))

    def mapSum(list, func) do
      list |> map(func) |> sum
    end

    # max([]) is undefined
    def max([x]), do: x
    def max([head|tail]), do: Kernel.max(head, max(tail))

    def span(from, to) when from > to, do: []
    def span(from, to), do: [from | span(from+1, to)]
    
    def my_flatten([]), do: []
    def my_flatten([head | tail]) when is_list(head), do: (my_flatten head) ++ (my_flatten tail)
    def my_flatten([head | tail]), do: [head | my_flatten tail]

    def concat([]), do: []
    def concat([head | tail]), do: head ++ (concat tail)
end