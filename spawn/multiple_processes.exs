defmodule MultipleProcesses do

  import :timer, only: [ sleep: 1 ]

  def child(parent) do
    send parent, "Hello"
#    raise("Exception")     # uncomment to see the trace when raising an exceptio
  end

  def loop_receive do
    receive do
      msg -> IO.puts inspect msg
      loop_receive()  
    after 500 ->
      IO.puts "No more messages"
    end

  end

  def run do
    spawn_link(MultipleProcesses, :child, [self()])
    spawn_link(MultipleProcesses, :child, [self()])
    sleep 500
    loop_receive()
  end
  
end