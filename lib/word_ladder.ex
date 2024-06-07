defmodule WordLadder do
  @moduledoc """
  Documentation for `WordLadder`.
  """
  alias WordLadder.Core
  alias WordLadder.Server

  def start() do
    start_server()
  end

  def make_guess(word) do
    Server.make_guess(word)
  end

  def show(%Core.Ladder{} = ladder), do: Core.show(ladder)

  defp start_server(), do: Server.start_link(Core.new())
end
