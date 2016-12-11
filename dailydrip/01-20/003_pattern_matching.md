### Matching Operator(think assignment/assertions)

```elixir
foo = 1
1 = foo
#1
2 = foo
#** (MatchError) no match of right hand side value: 1
{:foo, bar} = {:foo, 3}
#{:foo, 3}
bar
# 3
{_, bar} = {1,2}
bar
# 2
```

```elixir
# Elixir removes this restriction, and so they had to provide this facility to 
#differentiate between variable binding and variables used for matches
[a, 2] = [1, 2]
[a, 2] = [3, 2] # Here, a gets re-bound
[^a, 2] = [4, 2] # MatchError
```

### Function

```elixir
print_name_egotistically = fn
  :carmen -> "Your name is Carmen"
        _ -> "I don't care what your name is !"
end
#Function<6.52032458/1 in :erl_eval.expr/5>

print_name_egotistically.(:carmen)
#"Your name is Carmen"
print_name_egotistically.(:nobody)
"I don't care what your name is !"
```

### Case Statements

```elixir
case {1,2,3} do 
  {4,5,6} -> "No match here"
  {1,2,3} -> "This matches"
  {_,2,3} -> "This would match, but since it's below match it isn't hit."
end
# "This matches"
case {1,2,3} do 
  {4,5,6} -> "No match here"
  {1,2,3} -> "This matches"
  {_,2,3} -> "This would match this time."
end
#"This would match this time"
```
