defmodule Pong do
  def start do
    await(0)
  end

  def await(count) do
    receive do
      {:pong, pid} -> send pid, {:ping, self}
    end
    IO.puts "Pong received a pong #{count + 1} times"
    await( count + 1)
  end
end
