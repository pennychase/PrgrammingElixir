defmodule Stack.Server do

  use GenServer

  ### Client API

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end

  def show do
    GenServer.call(__MODULE__, :show)
  end


  ### Stack Server Callbacks

  def init(initial_stack) do
    { :ok, Stack.Stash.get() } 
  end
   
  def handle_call(:pop, _from, [ top | rest ]) do
    { :reply, top, rest}
  end

  def handle_call(:show, _from, current_stack) do
    { :reply, current_stack, current_stack}
  end

  def handle_cast({ :push, value }, current_stack) do
    { :noreply, [ value | current_stack] }
  end

  def terminate(reason, current_number) do
    Sequence.Stash.update(current_number)
  end
    

end