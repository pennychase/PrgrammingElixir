defmodule StrCount do

   def count(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :count, file, client } -> 
        send client, { :answer, str_count_file(file), self() }
        count(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  def str_count_file(file, str \\ "def") do
    Regex.scan(~r"#{str}", File.read!(file))
    |> length
  end

end


defmodule Scheduler do

  def run(num_processes, module, func, files) do  
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(files, 0)
  end

  defp schedule_processes(processes, queue, accum) do
    receive do
      { :ready, pid } when length(queue) > 0 ->
        [next | tail] = queue
        send pid, {:count, next, self()}
        schedule_processes(processes, tail, accum)

      { :ready, pid } ->
        send pid, { :shutdown }
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, accum)
        else
          accum
        end

      {:answer, result, _pid} ->
        schedule_processes(processes, queue, result + accum )
    end
  end
  
end

is_regular = fn path ->
    {:ok, stat} = File.stat(path)
    :regular == stat.type
  end

files = File.ls! |> Enum.filter(&is_regular.(&1))

Enum.each 1..10, fn num_processes ->
  { time, result } = :timer.tc(Scheduler, :run, [num_processes, StrCount, :count, files] )
  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\nTime:  #{time}"
  end
  :io.format("~2B     ~.4f~n", [num_processes, time/1000000.0])
end
