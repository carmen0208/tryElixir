defmodule Example do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def two, do: @attr
end

IO.puts "#{Example.first} #{Example.two}" #=> one two

# Internally, module names are just atoms. 
# When you write a name starting with an uppercase letter, such as IO, 
# Elixir converts it internally into an atom called Elixir.IO.
IO.puts is_atom IO
IO.puts to_string IO
IO.puts "Elixir.IO" === IO
