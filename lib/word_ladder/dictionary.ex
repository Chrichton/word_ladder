defmodule WordLadder.Dictionary do
  alias WordLadder.Validator

  @animals ~w("bass bear beef bird boar buff bull cape carp cavy chip coot crab crow dane deer dodo dove duck fawn frog gaur gerb goat gosh gull hare hawk hind ibis jenn kang kite koal kudu lamp lark lion lynx mare mink mola mole moth mule myna newt ogre oryx ostr otus paca pika pike pony puff puma quok rabb rhea rook sand seal shad sika skua swan tahr teal tern toad vole wasp wels weta wige wolf xema zebu")

  def generate_word_ladders() do
    for animal1 <- @animals, animal2 <- @animals do
      generate_word_ladder(animal1, animal2)
    end
    |> Enum.reject(&(&1 == []))

    # |> Enum.map(&generate_word_ladder_recursive/1)
  end

  defp generate_word_ladder_recursive([last_animal | [pre_last_animal | _]] = animals) do
    dbg()

    if Validator.valid_move?(pre_last_animal, last_animal) do
      [next_animal, _] = generate_word_ladder(pre_last_animal, last_animal)

      [next_animal | animals]
    else
      animals
    end
  end

  defp generate_word_ladder(animal1, animal2) do
    if Validator.valid_move?(animal1, animal2) do
      [animal2, animal1]
    else
      []
    end
  end

  def words() do
    "deutsch.txt"
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.reject(&String.contains?(&1, ";"))
    |> Stream.filter(&(String.length(&1) == 4))
    |> Enum.to_list()
  end
end
