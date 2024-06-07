defmodule WordLadder do
  @moduledoc """
  Documentation for `WordLadder`.
  """
  alias WordLadder.Core
  alias WordLadder.Server

  @spec start() :: tuple()
  def start() do
    start_server()
  end

  @spec make_guess(String.t()) :: Core.Ladder.t()
  def make_guess(word) do
    case Server.make_guess(word) do
      {:error, reason} ->
        IO.puts(reason)
        IO.puts(show())

      ladder ->
        ladder
    end
  end

  @spec show() :: String.t()
  def show() do
    Server.show()
  end

  defp start_server(), do: Server.start_link(Core.new())
end
