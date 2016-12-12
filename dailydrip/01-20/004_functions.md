### Defining Anonymous Functions

```elixir
#ex1
print_name = fn
  {:person, first_name,last_name} -> first_name <> " " <> last_name
end
#ex2
calculation_items = fn
  [{:item, price1},{:item, price2}] -> price1 + price2
  {:item, price} -> price
end
```

### Calling Anonymous Functions

```elixir
print_name.({:person,"carmen","liu"})
#=> carmen liu
calculation_items.([{:item,15},{:item,22}])
# 37
calculation_items.({:item, 33})
#33
```

### Using Functions as first class types

ex1

```elixir
add = fn  
  num -> (fn num2 -> num + num2 end)
end
add.(3).(6)
#9

```

ex2

```elixir
political_greeter = fn
  name -> "Hello, #{name}, nice to meeti you !"
end

casual_greeter = fn
  name -> "Hey #{name}"
end

greet_person = fn
  greeter, {:person, first_name, last_name} -> greeter.(first_name <> " " <> last_name)
end

carmen = {:person, "Carmen", "Liu"}
greet_person.(political_greeter, carmen)
# "Hello, Carmen Liu, nice to meeti you !"
greet_person.(casual_greeter, carmen)
#"Hey Carmen Liu"
```
