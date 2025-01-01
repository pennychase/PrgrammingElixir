defmodule Spawn2 do

  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello #{msg}" } 
        greet()
    end
  end
  
end

# Client 
pid = spawn(Spawn2, :greet, [])   # spawn new process

send pid, { self(), "World!" }    # send message to the process
receive do                        # wait for response and print
  { :ok, message } -> IO.puts message
end

send pid, { self(), "Kermit!" }     # Send a different message
receive do                          # wait for response and print
  { :ok, message } -> IO.puts message
  after 500 -> IO.puts "The greeter has gone away"  # quit waiting if mno response 
end