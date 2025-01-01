defmodule SpawnTwo do

  def alice do
    receive do
      {sender, "alice"} -> send sender, {self(), "alice"}
    end
  end

  def bob do
    receive do
      {sender, "bob"} -> send sender, {self(), "bob"}
    end
  end

  def run do
    
    alice = spawn(SpawnTwo, :alice,[])
    bob = spawn(SpawnTwo, :bob,[])

    send alice, {self(), "alice"}
    send bob, {self(), "bob"}

    receive do 
        {_sender, "alice"} -> IO.puts "alice replied first"
        {_sender, "bob"} -> IO.puts "bob replied first"
    end 

      receive do 
        {_sender, "alice"} -> IO.puts "alice replied second"
        {_sender, "bob"} -> IO.puts "bob replied second"
    end 

  end

end