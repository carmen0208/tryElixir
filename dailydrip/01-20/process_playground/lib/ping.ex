defmodule Ping do
  def start do
    await(0)
  end

  def await(count) do
    receive do
      {:ping, pid} -> send pid, {:pong, self}
    end
    IO.puts "Ping received a ping #{count + 1} times"
    await( count + 1)
  end
end
