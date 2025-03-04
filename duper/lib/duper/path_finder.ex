defmodule Duper.PathFinder do
alias Duper.PathFinder

  use GenServer

  @me PathFinder

  ### API

  def start_link(root) do
    GenServer.start(__MODULE__, root, name: @me)
  end

  def next_path() do
    GenServer.call(@me, :next_path)
  end

  ### Server Callbacks

  def init(path) do
    DirWalker.start_link(path)
  end
  
  def handle_call(:next_path, _from, dir_walker) do
    path = case DirWalker.next(dir_walker) do
              [path] -> path
              other -> other
          end
    {:reply, path, dir_walker}
  end


end