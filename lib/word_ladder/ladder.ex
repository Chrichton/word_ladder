defmodule WordLadder.Ladder do
  @moduledoc """
  Functional Core for `WordLadder`.
  """
  @enforce_keys [:start_word, :end_word, :word_list]
  defstruct [:start_word, :end_word, :word_list]

  @type t :: %__MODULE__{
          start_word: String.t(),
          end_word: String.t(),
          word_list: [String.t()]
        }

  alias WordLadder.Ladder
  alias WordLadder.Dictionary

  def new() do
    [start_word, _, end_word] = random_ladder(Dictionary.ladders())

    %Ladder{
      start_word: start_word,
      end_word: end_word,
      word_list: []
    }
  end

  def add_word(%Ladder{word_list: word_list} = core, word) do
    %Ladder{core | word_list: [word | word_list]}
  end

  def show(%Ladder{} = ladder), do: words(ladder) |> Enum.join(" -> ")

  defp words(%Ladder{start_word: first, end_word: last, word_list: middle}),
    do: [first | Enum.reverse(middle)] ++ [last]

  defp random_ladder(ladders) do
    ladders
    |> Stream.drop(:rand.uniform(Enum.count(ladders)) - 1)
    |> Enum.take(1)
    |> hd()
  end
end
