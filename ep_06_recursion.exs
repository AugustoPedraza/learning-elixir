defmodule Ep06Recursion do
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

  def reverse(list) do
    reverse(list, [])
  end

  defp reverse([h | t], reversed_list) do
    reversed_list = [h | reversed_list]
    reverse(t, reversed_list)
  end

  defp reverse([], reversed_list) do
    reversed_list
  end

  defp sum([h | t], acc) do
    sum(t, acc + h)
  end

  defp sum([], acc) do
    acc
  end
end
