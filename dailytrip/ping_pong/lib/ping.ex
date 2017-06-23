defmodule Ping do
  def start do
    receive do
      {:pong, sender} when is_pid(sender) ->
        send(sender, {:ping, self()})
      _ ->
        IO.puts :stderr, "Unexpected message received"
    end
  end
end

