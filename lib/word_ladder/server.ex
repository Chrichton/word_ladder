defmodule WordLadder.Server do
  use GenServer
  alias WordLadder.Core.Ladder

  # Client API
  def start_link(%Ladder{} = ladder) do
    GenServer.start_link(__MODULE__, ladder, name: __MODULE__)
    ladder
  end

  def make_guess(word) do
    GenServer.call(__MODULE__, {:guess, word})
  end

  # Server API

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:guess, word}, _from, %Ladder{word_list: word_list} = state) do
    new_state = %Ladder{state | word_list: [word | word_list]}
    {:reply, new_state, new_state}
  end
end
