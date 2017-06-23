defmodule Portal do
  defstruct [:left, :right]

  @doc """
  Shoots a new door with the give `color`
  """
  def shoot(color) do
    Supervisor.start_child(Portal.Supervisor, [color])
  end

  @doc """
  Starts transfering `data` from `left` to `right`.
  """
  def transfer(left, right, data) do
    for item <- data do
      Portal.Door.push(left, item)
    end

    %Portal{left: left, right: right}
  end

  @doc """
  Pushes data to the right in the given `portal`.
  """
  def push_right(portal) do
    case Portal.Door.pop(portal.left) do
      :error -> :ok
      {:ok, h} ->
        Portal.Door.push(portal.right, h)
    end

    portal
  end
end

defimpl Inspect, for: Portal do
  def inspect(%Portal{left: left, right: right}, _) do
    left_door = inspect(left)
    right_door = inspect(right)

    left_data = left
                  |> Portal.Door.get
                  |> Enum.reverse
                  |> inspect

    right_data = right
                  |> Portal.Door.get
                  |> inspect

    max = max(String.length(left_door), String.length(left_data))

    """
    #Portal<
      #{String.rjust(left_door, max)} <=> #{right_door}
      #{String.rjust(left_data, max)} <=> #{right_data}
    >
    """
  end
end
