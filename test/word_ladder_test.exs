defmodule WordLadderTest do
  use ExUnit.Case
  doctest WordLadder

  alias WordLadder.Core.Ladder

  test "valid_move empty word_list" do
    assert WordLadder.Validator.valid_move?(%Ladder{start_word: "a"}, "b")
    refute WordLadder.Validator.valid_move?(%Ladder{start_word: "a"}, "a")
  end

  test "valid_move" do
    assert WordLadder.Validator.valid_move?(%Ladder{word_list: ["a"]}, "b")
    refute WordLadder.Validator.valid_move?(%Ladder{word_list: ["a"]}, "a")
  end
end
