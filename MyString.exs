defmodule MyString do

    def printable_ascii?(str), do: Enum.all?(str, fn ch -> ch in ?\s .. ?~ end)

    def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

    def palindrome?(word), do: Enum.reverse(word) == word

end