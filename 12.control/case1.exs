defmodule Users do
  carmen = %{name: "Carmen", state: "Sichuan", likes: "programming"}

  case carmen do 
    %{state: some_state} = person ->
      IO.puts "#{person.name} lives in #{some_state}"
    _->
      IO.puts "No matches"
  end
end
