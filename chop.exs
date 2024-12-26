defmodule Chop do

    def guess(actual, range = low .. high//_) do
        guess = div(low + high, 2)
        IO.puts "Is it #{guess}?"
        _guess(actual, guess, range)
    end
    
    defp _guess(actual, guess, _low .. high//_)
        when actual > guess do
            guess(actual, guess .. high)
        end

    defp _guess(actual, guess, low .. _high//_)
        when actual < guess do
            guess(actual, low .. guess)
        end

    defp _guess(actual, guess, _range)
        when actual == guess do
            IO.puts "It's #{guess}!"        
        end
end