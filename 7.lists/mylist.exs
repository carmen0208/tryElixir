defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head|tail]), do: [head*head|square(tail)]

  def add_1([]), do: []
  def add_1([head|tail]), do: [head+1|add_1(tail)]

  def map([],_func), do: []
  def map([head|tail],func), do: [func.(head)|map(tail,func)]


  def sum([],total), do: total
  def sum([head|tail],total), do: sum(tail,head+total)
end

IO.puts MyList.len([])
IO.puts MyList.len([11,12,13,14,15])
IO.puts MyList.square [4,5,6]
IO.puts MyList.add_1 [4,6,8]
IO.puts MyList.map [1,2,3,4], fn(n) -> n*n end #=> [1, 4, 9, 16]
IO.puts MyList.map [1,2,3,4], &(&1 + 1) #=>[2, 3, 4, 5]
#IO.puts MyList.map [1,2,3,4], &(&1 > 2) #=>[false, false, true, true]
IO.puts MyList.sum([1,2,3,4,5], 0)
