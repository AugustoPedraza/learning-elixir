defmodule Ping do
  def start do
    loop()
  end

  defp loop do
    receive do
      {:pong, sender} when is_pid(sender) ->
        IO.puts "ping ->"
        :timer.sleep 500
        send(sender, {:ping, self()})
      {:ping, sender} when is_pid(sender) ->
        IO.puts "                  <- pong"
        :timer.sleep 500
        send(sender, {:pong, self()})
      _ ->
        IO.puts :stderr, "Unexpected message received"
    end

    loop()
  end
end

