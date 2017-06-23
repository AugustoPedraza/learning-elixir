defmodule Ping do
  def start do
    loop()
  end

  defp loop do
    receive do
      {:pong, sender} when is_pid(sender) ->
        send(sender, {:ping, self()})
      _ ->
        IO.puts :stderr, "Unexpected message received"
    end

    loop()
  end
end

