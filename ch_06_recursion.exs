defmodule Ch06Recursion do
  def sum(list) do
    sum(list, 0)
  end

  def sum([h | t], acc) do
    sum(t, acc + h)
  end

  def sum([], acc) do
    acc
  end
end
