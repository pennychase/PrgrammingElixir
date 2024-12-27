defmodule MyString do

    # character lists
    def printable_ascii?(str), do: Enum.all?(str, fn ch -> ch in ?\s .. ?~ end)

    def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

    def palindrome?(word), do: Enum.reverse(word) == word

    # binary strings
    def center(strs) do
        {strs_lens, max_len} = _make_inputs(strs)
        strs_lens |> Enum.map(&IO.puts(_center_one(&1, max_len)))
    end

    defp _center_one({str, len}, max_len), do: String.pad_leading(str, len + div(max_len - len, 2))

    defp _make_inputs(strs) do
        Enum.map_reduce(strs, 0, fn str, acc ->
            len = String.length(str)
            {{str, len}, max(len, acc)} end)
    end

    def capitalize_sentences(sentences) do
      sentences
        |> String.split(". ")
        |> Enum.map(&String.capitalize(&1))
        |> Enum.intersperse(". ")
        |> List.foldr("", &(&1 <> &2))
    end

end