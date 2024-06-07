defmodule WordLadder do
  @moduledoc """
  Documentation for `WordLadder`.
  """
  alias WordLadder.Core
  alias WordLadder.Server

  @spec start() :: Core.Ladder.t()
  def start() do
    start_server()
  end

  @spec make_guess(String.t()) :: Core.Ladder.t()
  def make_guess(word) do
    Server.make_guess(word)
  end

  @spec show(Core.Ladder.t()) :: String.t()
  def show(%Core.Ladder{} = ladder), do: Core.show(ladder)

  defp start_server(), do: Server.start_link(Core.new())
end
