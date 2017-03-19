## Items that going to go throught

* `all?` :  returns true unless one or more items in the collection return false for the provided fun:
  
  ```sh
  iex(1)> Enum.all?([1,2,3], fn(x) -> rem(x, 2) == 0 end)
  false
  iex(2)> Enum.all?([1,2,3], fn(x) -> x > 0 end)
  true
   ```
* `any?` : returns true if at least one item in the collection returns true

   ```sh
   iex(3)> Enum.any?([1,2,3], fn(x) -> rem(x,2) == 0 end)
   true
   iex(4)> Enum.any?([1,2,3], fn(x) -> x > 0 end)
   true
   ```
* `at` : finds the element in the collection at the given index. *This is a
  zero-based index*

  ```sh
  iex(5)> Enum.at([1,2,3], 1)
  2
  iex(6)> Enum.at([1,2,3], 4)
  nil
  ```
* `chunks`: returns chunks of the collection. It has a few different ways of being called. The most simple and understandable is Enum.chunks/2

   ```sh
   iex(7)> Enum.chunk([1,2,3,4],2)
   [[1, 2], [3, 4]]
   iex(8)> Enum.chunk([1,2,3,4,5],2)
   [[1, 2], [3, 4]]
   iex(9)> Enum.chunk([1,2,3,4,5],3, 2)
   [[1, 2, 3], [3, 4, 5]]
   iex(10)> Enum.chunk([1,2,3,4,5],3)
   [[1, 2, 3]]
   iex(11)> Enum.chunk([1,2,3,4,5],3,3)
   [[1, 2, 3]]
   iex(12)> Enum.chunk([1,2,3,4,5],3,2)
   [[1, 2, 3], [3, 4, 5]]
   iex(13)> Enum.chunk([1,2,3,4,5],3,1)
   [[1, 2, 3], [2, 3, 4], [3, 4, 5]]
   iex(14)> Enum.chunk([1,2,3,4,5],3,3,[1])
   [[1, 2, 3], [4, 5, 1]]
   iex(15)> Enum.chunk([1,2,3,4,5],3,3,[])
   [[1, 2, 3], [4, 5]]
   iex(16)> Enum.chunk([1,2,3,4,5],3,3,[2])
   [[1, 2, 3], [4, 5, 2]]
   ```
* `chunks_by`: splits the input collection at each point where fun returns a new value

   ```sh
   iex(19)> Enum.chunk_by([1, 2, 2, 3, 4, 4, 6, 7, 7], fn(x) -> rem(x, 2) == 1 end)
   [[1], [2, 2], [3], [4, 4, 6], [7, 7]]
   ```
* `concat`: concatenates a list of enumerables into a single list:

   ```sh
   iex(19)> Enum.concat([1..2,3..3])
   [1, 2, 3]
   ```
* `count`: returns the number of items in the input collection

   ```sh
   iex(21)> Enum.count([:a,1], fn(x) -> is_integer(x) end)
   1
   ```

