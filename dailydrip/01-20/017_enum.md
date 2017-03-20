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

* `drop`drops the first count items from collection.

  ```sh
  Enum.drop([1,2,3],2)
  [3]
  ```
  
* `drop_while`: drops the first count items from collection.

   ```sh
  Enum.drop_while([1,3,5,2,4,7],fn(x) -> rem(x,2)!= 0 end)
  [2, 4, 7] 
   ```

* `each`: invokes the given fun for each item in the collection.

  ```sh
  iex(24)> Enum.each([1,2,3], fn(x)-> IO.puts("#{x}") end)
  1
  2
  3
  :ok
  ```

* `empty?`

   ```sh
   Enum.empty?([])
   true
   iex(27)> Enum.empty?([3,2,1])
   false
   ```

* `fetch`: Enum.fetch finds the element at the given index (zero-based). Returns { :ok, element } if found, otherwise :error.

  ```sh
   iex(28)> Enum.fetch([1,2,3],3)
   :error
   iex(29)> Enum.fetch([1,2,3],2)
   {:ok, 3}
  ```

* `filter,filter_map`

  ```sh
  iex(30)> Enum.filter([1,2,3,4,5], fn(x) -> rem(x,2)==0 end)
  [2, 4]
  iex(31)> Enum.filter_map([1,2,3,4,5], fn(x) -> rem(x, 2) == 0 end , fn(x) -> "foo#{x}" end )
  ["foo2", "foo4"]
  ```


  ```sh
  iex(31)> Enum.filter_map([1,2,3,4,5], fn(x) -> rem(x, 2) == 0 end , fn(x) -> "foo#{x}" end )
  ["foo2", "foo4"]
  ```

* `find,find_index,find_value`

   ```sh
   iex(14)> Enum.find([-1, 0, 1], fn(x) -> x >= 0 end)
   0
   iex(15)> Enum.find([-1, 0, 1], fn(x) -> x >= 2 end)
   nil

   iex(16)> Enum.find([-1, 0, 1], :foo, fn(x) -> x >= 0 end)
   0
   iex(17)> Enum.find([-1, 0, 1], :foo, fn(x) -> x >= 2 end)
   :foo
   #Enum.find_index: Just like find, but returns the index of the element found, rather than the element itself.
   iex(18)> Enum.find_index([-1, 0, 1], fn(x) -> x >= 0 end)
   # 1
   iex(19)> Enum.find_index([-1, 0, 1], fn(x) -> x >= 2 end)
   #nil

   # Enum.find_value: Just like find, but returns the value of the fun rather than the element that made fun return a truthy value.
   iex(20)> Enum.find_value([-1, 0, 1], fn(x) -> x >= 0 end)
   # true
   iex(21)> Enum.find_value([-1, 0, 1], fn(x) -> x >= 2 end)
   # nil
   ```
* `first`

   ```sh
   iex(22)> Enum.first([1,2,3])
   #1
   iex(23)> Enum.first([])
   #nil
   ```

* `flat_map`

   ```sh
   iex(25)> Enum.flat_map([1,2,3], fn(x) -> ["#{x}", "#{x+1}"] end)
   #["1", "2", "2", "3", "3", "4"]
   ```

* `join`

   ```sh
   iex(29)> Enum.join([1,2,3], ":")
   # "1:2:3"
   iex(30)> Enum.join([1,2,3])
   # "123"
   ```

* map
* map_join
* map_reduce
* max
* max_by
* member?
* min
* min_by
* partition
* reduce
* reject
* reverse
* shuffle
* slice
* sort
* split
* split_while
* take
* take_every
* take_while
* to_list
* uniq
* with_index
* zip
