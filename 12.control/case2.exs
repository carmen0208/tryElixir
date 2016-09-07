defmodule Bouncer do 
  carmen = %{name: "Carmen", age: 34}

  case carmen do 
    person = %{age: age} when is_number(age) and age >= 21 ->
      IO.puts "You are cleared to enter the FooBar, #{person.name}"
    _->
      IO.puts "Sorry, no admission"

  end
end
