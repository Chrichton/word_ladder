defmodule WordLadder.Dictionary do
  alias WordLadder.Validator

  @animals ~w(bass bear beef bird boar buff bull cape carp cavy chip coot crab crow dane deer dodo dove duck fawn frog gaur gerb goat gosh gull hare hawk hind ibis jenn kang kite koal kudu lamp lark lion lynx mare mink mola mole moth mule myna newt ogre oryx ostr otus paca pika pike pony puff puma quok rabb rhea rook sand seal shad sika skua swan tahr teal tern toad vole wasp wels weta wige wolf xema zebu)

  def generate_word_ladders() do
    for animal1 <- @animals,
        animal2 <- @animals,
        animal3 <- @animals do
      generate_word_ladder([animal1, animal2, animal3])
    end
    |> Enum.reject(&(&1 == []))
  end

  def generate_word_ladders_comb() do
    Combination.combine(@animals, 3)
    |> Enum.map(&generate_word_ladder/1)
    |> Enum.reject(&(&1 == []))
  end

  defp generate_word_ladder([animal1, animal2, animal3] = animals) do
    if Enum.uniq(animals) == animals and
         Validator.valid_move?(animal1, animal2) and
         Validator.valid_move?(animal2, animal3) do
      [animal3, animal2, animal1]
    else
      []
    end
  end

  def words(), do: @animals

  def words_from_file() do
    "deutsch.txt"
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.reject(&String.contains?(&1, ";"))
    |> Stream.filter(&(String.length(&1) == 4))
    |> Enum.to_list()
  end

  # Combination.combine(WordLadder.Dictionary.words, 3)
end
