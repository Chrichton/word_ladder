defmodule WordLadder.Validator do
  alias WordLadder.Ladder

  def valid_move?(%Ladder{start_word: start_word, word_list: []}, guessed_word),
    do: difference(start_word, guessed_word) == 1

  def valid_move?(%Ladder{word_list: [last_guessed_word | _]}, guessed_word),
    do: difference(guessed_word, last_guessed_word) == 1

  defp difference(word1, word2) do
    String.graphemes(word1)
    |> Enum.zip(String.graphemes(word2))
    |> Enum.reduce(0, fn {a, b}, acc -> if a == b, do: acc, else: acc + 1 end)
  end
end
