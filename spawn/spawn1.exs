defmodule Spawn1 do

  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
    end
  end
  
end

# Client
pid = spawn(Spawn1, :greet, [])   # spawn new process
send pid, { self(), "World!"}     # send message to the process

receive do                        # wait for response and print
  {:ok, message} -> IO.puts message
end