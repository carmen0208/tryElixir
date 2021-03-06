defmodule Spawn4 do 
  def greet do 
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}" }
        greet
    end
  end
end
#here's a client  
pid = spawn(Spawn2, :greet, [])
send pid, {self, "World!"}
receive do 
  {:ok, message} ->
    IO.puts message
end

#here's client 2
send pid, {self, "Ninja Carmen!"}
receive do 
  {:ok, message} ->
    IO.puts message
  after 1000 -> 
    IO.puts "The greet has gone away....."
end



