defmodule WordLadder.Validator do
  @moduledoc """
  Validator for `WordLadder`.
  """

  alias WordLadder.Ladder
  alias WordLadder.Dictionary

  def valid_move?(%Ladder{start_word: start_word, word_list: []}, guessed_word),
    do: valid_move?(start_word, guessed_word)

  def valid_move?(%Ladder{word_list: [last_guessed_word | _]}, guessed_word),
    do: valid_move?(guessed_word, last_guessed_word)

  def valid_move?(word1, word2) do
    word2 in Dictionary.words() and one_change?(word1, word2)
  end

  defp one_change?(word1, word2) do
    String.graphemes(word1)
    |> Enum.zip(String.graphemes(word2))
    |> Enum.reduce(0, fn {a, b}, acc -> if a == b, do: acc, else: acc + 1 end)
    |> Kernel.==(1)
  end
end
