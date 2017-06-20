defmodule Ch06Recursion do
  def sum(list) do
    sum(list, 0)
  end

  def reduce([h | t], acc, func) do
    new_acc = func.(h, acc)
    reduce(t, new_acc, func)
  end

  def reduce([], acc, _func) do
    acc
  end

  defp sum([h | t], acc) do
    sum(t, acc + h)
  end

  defp sum([], acc) do
    acc
  end
end
