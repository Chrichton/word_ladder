defmodule WordLadder.Server do
  @moduledoc """
  Server for `WordLadder`.
  """

  use GenServer

  alias WordLadder.Server
  alias WordLadder.Ladder
  alias WordLadder.Validator

  # Client API

  def start_link(%Ladder{} = ladder) do
    GenServer.start_link(__MODULE__, ladder, name: __MODULE__)
  end

  # called from start_child
  def start_link({name, %Ladder{} = ladder}) do
    GenServer.start_link(__MODULE__, ladder, name: name)
  end

  def start_child(name) do
    # child_spec =
    #   Supervisor.child_spec({Server, {name, Ladder.new()}}, id: {Server, name})
    #   DynamicSupervisor.start_child(:dsup, {Server, {name, Ladder.new()}})

    DynamicSupervisor.start_child(:dsup, {Server, {name, Ladder.new()}})
  end

  def make_guess(word) do
    GenServer.call(__MODULE__, {:guess, word})
  end

  def show() do
    GenServer.call(__MODULE__, :show)
  end

  # Server API

  @impl true
  def init(state) do
    # IO.puts("Starting #{elem(state, 0)}...")
    {:ok, state}
  end

  @impl true
  def handle_call({:guess, word}, _from, %Ladder{word_list: word_list} = state) do
    if Validator.valid_move?(state, word) do
      new_state = %Ladder{state | word_list: [word | word_list]}
      {:reply, new_state, new_state}
    else
      {:reply, {:error, "Invalid move: #{word}"}, state}
    end
  end

  @impl true
  def handle_call(:show, _from, state) do
    {:reply, Ladder.show(state), state}
  end
end
