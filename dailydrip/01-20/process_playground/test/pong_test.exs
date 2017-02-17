defmodule PongTest do
  use ExUnit.Case
  # import Pingx
  test 'it responds to a pong with a ping' do
    pong = spawn_link(Pong, :start, [])
    send pong, {:pong, self}
    assert_receive {:ping, pong}
  end

  test 'it records to two pongs with two pings' do
    pong = spawn_link(Pong, :start, [])
    send pong, {:pong, self}
    assert_receive {:ping, pong}
    send pong, {:pong, self}
    assert_receive {:ping, pong}
  end
end
