defmodule Schizo do
  def uppercase(string) do
    # string
    # Split string on spaces into a list of words
    # http://elixir-lang.org/docs/stable/elixir/String.html # split
    words = String.split(string)
    # Transform every other word (uppercasing)
    # http://elixir-lang.org/docs/stable/elixir/Stream.html#with_index/2
    words_with_index = Stream.with_index(words)

    transformed_words = Enum.map(words_with_index, &uppercase_every_other_word/1)
    # Join the words back with space
    #http://elixir-lang.org/docs/stable/elixir/Enum.html#join/2
    Enum.join(transformed_words, " ")
  end

  def uppercase_every_other_word({word, index}) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> String.upcase(word)
    end
  end
end
