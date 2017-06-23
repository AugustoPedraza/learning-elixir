defmodule PingPongTest do
  use ExUnit.Case
  doctest PingPong

  test "it responds to a pong with a ping" do
    ping = spawn(Ping, :start, [])

    send(ping, {:pong, self()})

    assert_receive {:ping, ^ping}, 600
  end

  test "it responds to two messages" do
    ping = spawn(Ping, :start, [])
    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}, 600

    send(ping, {:pong, self()})
    assert_receive {:ping, ^ping}, 600
  end
end
