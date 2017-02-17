
defmodule PingTest do
  use ExUnit.Case
  # import Pingx
  test 'it responds to a pong with a ping' do
    ping = spawn_link(Ping, :start, [])
    send ping, {:ping, self}
    assert_receive {:pong, ping}
  end

  test 'it records to two pongs with two pings' do
    ping = spawn_link(Ping, :start, [])
    send ping, {:ping, self}
    assert_receive {:pong, ping}
    send ping, {:ping, self}
    assert_receive {:pong, ping}
  end
end
