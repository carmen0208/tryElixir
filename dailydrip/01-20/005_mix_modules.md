### How to create a module

```sh
mix new module_example

```

### Compiliing a module

* way 1

   ```sh
iex lib/module_example.ex
ModuleExample.publish("who")
#"who"
#is's works
   ```

way 2

   ```sh
elixirc lib/modules_example.ex
# will generate a file named Elixir.ModulesExample.beam
   ```

## Examine a module's return value

in iex:

```elixir
output = defmodule Foo do
  def bar do
    "whee"
  end
end
#{:module, Foo,
# <<70, 79, 82, 49, 0, 0, 4, 220, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 126,
#   131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115,
#   95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>, {:bar, 0}}
```

The tuple contains, in the following order:
* An atom, :module
* The constant representing the module: Foo
* A binary containing the bytecode defining the module.
* A tuple describing the last function defined in that module

## Add documentation to a module

changes in example file

```sh
iex -S mix
 h(ModuleExample)
 #A example of module doc.
 h(ModuleExample.publish)
 #A example of method doc.
```

## Generating documentation output using ExDoc

```sh
mix deps.get
mix docs
```
