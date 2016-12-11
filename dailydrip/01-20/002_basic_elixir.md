#### Atoms

```elixir
:foo
:bar
:"some string"
:certain_@symbols_are_ok_too
:foo == :foo  # true
:bar == "bar" # false

```

#### Numbers& Integers & Floats

```elixir
1234567
1_234_567
1_234_567 == 1234567 # You can use underscores to make numbers easier to read
12 + 24 # 36
19 - 100 # -81
1.23
350.72
.25 #=> (SyntaxError) iex:1: syntax error before: '.'
```

#### Lists

```elixir
[1,2,3]
[:foo,:bar]
[:also,[:they,:can],[:contain,:lists]]

a = [1, 2, 3]
hd(a) # 1
tl(a) # [2, 3]

```

#### Tuples

```ruby
{1,2,3}
{:foo,:bar}

```

#### Keyword Lists

```elixir
[author:"carmen",do:"learning"]
[{:author, "carmen"},{:do, "learning"}]
 [{:author, "carmen"},{:do, "learning"}] == [author: "carmen",do: "learning"] 
#=> true
```

#### Regex

```elixir
Regex.replace %r/[aeiou]/, "Beginning Elixir", "Z"
```

#### Booleans

```elixir
false == :false
#true
nil == :nil
#true
```
