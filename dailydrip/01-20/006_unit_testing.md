## ExUnit

Elixir's build-in Unit Testing framework

* [[ExUnit.Assertions|http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html]]

## Example(TDD)

```sh
mix new schizo
```

* [example](schizo/test/schizo_test.exs)

## Run test

```sh
mix test
```

## Makes Doc tests wrong:

`doctest` would run docs as a testcase. if the input and output is not match, it would be run.

```sh
mix test

#1) test doc at Schizo.unvowel/1 (1) (SchizoTest)
#   test/schizo_test.exs:3
#   Doctest failed
#   code: Schizo.unvowel("you are silly") === "you arr silly"
#   left: "you r silly"
#   stacktrace:
#     lib/schizo.ex:19: Schizo (module)
```
