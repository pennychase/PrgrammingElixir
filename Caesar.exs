defmodule Caesar do

    def caesar(chars, rotation), do: Enum.map(chars, &rot1(&1,rotation))

    defp rot1(char, rot) 
        when (char + rot) <= ?z, do: char + rot

    defp rot1(char, rot), do: char + rot - 26
    
end