defmodule WordLadder.Validator do
  @moduledoc """
  Validator for `WordLadder`.
  """

  alias WordLadder.Ladder
  alias WordLadder.Dictionary

  def valid_move?(%Ladder{start_word: start_word, word_list: []}, guessed_word),
    do: valid_move?(start_word, guessed_word)

  def valid_move?(%Ladder{word_list: [last_guessed_word | _]}, guessed_word),
    do: valid_move?(last_guessed_word, guessed_word)

  def valid_move?(word, guessed_word) do
    guessed_word in Dictionary.words() and one_change?(word, guessed_word)
  end

  defp one_change?(word, guessed_word) do
    String.graphemes(word)
    |> Enum.zip(String.graphemes(guessed_word))
    |> Enum.reduce(0, fn {a, b}, acc -> if a == b, do: acc, else: acc + 1 end)
    |> Kernel.==(1)
  end
end
