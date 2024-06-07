defmodule WordLadder.Core do
  defmodule Ladder do
    defstruct start_word: "", end_word: "", word_list: []
  end

  alias WordLadder.Core.Ladder

  @words ~w(ant baboon badger bat bear beaver camel cat clam cobra cougar
    coyote crow deer dog donkey duck eagle ferret fox frog goat goose hawk
    iguana lizard llama mole monkey moose mouse mule newt otter owl panda
    parrot pigeon python rabbit ram rat raven rhino salmon seal shark
    sheep skunk sloth snake spider stork swan tiger toad trout turkey
    turtle weasel whale wolf wombat zebra)

  def new() do
    start_word = random_word(@words)

    end_word =
      @words
      |> Enum.reject(&(&1 == start_word))
      |> random_word()

    %Ladder{
      start_word: start_word,
      end_word: end_word,
      word_list: []
    }
  end

  def add_word(%Ladder{word_list: word_list} = core, word) do
    %Ladder{core | word_list: [word | word_list]}
  end

  def show(%Ladder{start_word: start_word, end_word: end_word, word_list: word_list}),
    do: "#{start_word} #{word_list |> Enum.reverse() |> Enum.join(" ")} #{end_word}"

  defp random_word(word_list) do
    word_list
    |> Stream.drop(:rand.uniform(Enum.count(word_list)) - 1)
    |> Enum.take(1)
  end
end
