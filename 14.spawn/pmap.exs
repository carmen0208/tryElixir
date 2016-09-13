defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
      |> Enum.map(fn (elem) -> 
                 spawn_link fn -> (send me, {self, fun.(elem)}) end
     end)
      |> Enum.map(fn (pid) -> 
                  receive do { ^pid, result } -> result end
     end)
  end
end
# Parallel.pmap 1..10, &(&1 * &1)
#==>[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
# The first transformation maps collection into a list of PIDs, 
# where each PID in the list runs the given function on an individual list element. 
# If the collection contains 1,000 items, we’ll run 1,000 processes.
