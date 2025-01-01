defmodule MonitorProcesses do

  import :timer, only: [ sleep: 1 ]

  def child(parent) do
    send parent, "Hello"
#    raise("Exception")     # uncomment to see the trace when raising an exceptio
  end

  def loop_receive do
    receive do
      msg -> IO.puts "MESSAGE RECEIVED: #{inspect msg}"
      loop_receive()  
    after 500 ->
      IO.puts "No more messages"
    end

  end

  def run do
    res = spawn_monitor(MultipleProcesses, :child, [self()])
    IO.puts inspect res
    res = spawn_monitor(MultipleProcesses, :child, [self()])
    IO.puts inspect res
    sleep 500
    loop_receive()
  end
  
end