 defmodule Seqnumbers.Server do
   
  use GenServer
  alias Seqnumbers.Impl

  def init(initial_number) do
    { :ok, initial_number }
  end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, Impl.next(current_number) } 
  end

  def handle_call( {:set_number, new_number}, _from, _current_number) do
    { :reply, new_number, Impl.set(new_number) }
  end

  def handle_cast({:increment_number, delta }, current_number) do
    { :noreply, Impl.increment(current_number, delta) }   
  end

  def format_status(_reason, [ _pdict, state]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end
    
end
  