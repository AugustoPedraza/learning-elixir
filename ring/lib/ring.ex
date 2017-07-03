defmodule Ring do
  def create_processes n do
    1..n |> Enum.map(fn _ -> spawn(fn -> loop() end ) end)
  end

  def link_processes([first_pid, second_pid | pids], linked_processes \\ []) do
    send(first_pid, {:link, second_pid})

    link_processes([second_pid | pids], [first_pid | linked_processes])
  end

  def link_processes([last_pid | []], linked_processes) do
    first_pid = List.last(linked_processes)
    send(last_pid, {:link, first_pid})

    [last_pid | linked_processes]

    :ok
  end

  defp loop do
    receive do
      {:link, link_to} when is_pid(link_to) ->
        Process.link(link_to)

        loop()

      :crash ->
        1/0
    end
  end

end
