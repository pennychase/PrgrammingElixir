defmodule Stack.Server do

  use GenServer

  ### Client API

  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, {:push, value})
  end


  ### Stack Server Callbacks

  def init(initial_stack) do
    { :ok, initial_stack } 
  end
   
  def handle_call(:pop, _from, [ top | rest ]) do
    { :reply, top, rest}
  end

  def handle_cast({ :push, value }, current_stack) do
    { :noreply, [ value | current_stack] }
  end

  def terminate(reason, state) do
    IO.puts "Server error: Reason(#{inspect reason}, State(#{inspect state})"
  end

end