defmodule Stack.Stash do

  use GenServer
  @me __MODULE__

  ### Client API

  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: @me)
  end

  def get() do
    GenServer.call(@me, { :get })
  end

  def update(new_number) do
    GenServer.cast(@me, { :update, new_number })
  end


  ### Server Callbacks

  def init(initial_stack) do
    { :ok, initial_stack}
  end

  def handle_call({ :get }, _from, current_stack) do
    { :reply, current_stack, current_stack }
  end

  def handle_cast( { :update, new_stack }, _current_stack) do
    { :noreply, new_stack}
  end
  
  
end