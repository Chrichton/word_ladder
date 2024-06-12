defmodule WordLadder do
  @moduledoc """
  The game `WordLadder`.
  """

  alias WordLadder.Ladder
  alias WordLadder.Server
  alias WordLadder.Validator

  @spec start() :: tuple()
  def start() do
    start_server()
  end

  @spec make_guess(String.t()) :: Ladder.t()
  def make_guess(word) do
    case Server.make_guess(word) do
      {:error, reason} ->
        IO.puts(reason)
        IO.puts(show())

      %Ladder{end_word: end_word} = ladder ->
        if Validator.valid_move?(word, end_word) do
          IO.puts("you won!")
          IO.puts(Ladder.show(ladder))
          stop()
        else
          ladder
        end
    end
  end

  @spec show() :: String.t()
  def show() do
    Server.show()
  end

  def stop(), do: GenServer.stop(Server, :normal)

  defp start_server(), do: Server.start_link(Ladder.new())
end
