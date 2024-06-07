defmodule WordLadder do
  @moduledoc """
  Documentation for `WordLadder`.
  """
  alias WordLadder.Core
  alias WordLadder.Server
  alias WordLadder.Validator

  @spec start() :: Core.Ladder.t()
  def start() do
    start_server()
  end

  @spec make_guess(Core.Ladder.t(), String.t()) :: Core.Ladder.t()
  def make_guess(%Core.Ladder{} = ladder, word) do
    if Validator.valid_move?(ladder, word) do
      Server.make_guess(word)
    else
      IO.puts("Invalid move")
      ladder
    end
  end

  @spec show(Core.Ladder.t()) :: String.t()
  def show(%Core.Ladder{} = ladder), do: Core.show(ladder)

  defp start_server(), do: Server.start_link(Core.new())
end
