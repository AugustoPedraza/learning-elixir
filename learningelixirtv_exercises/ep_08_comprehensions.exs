defmodule Ep08Comprehensions do
  def evens_up_to(n) do
    for n <- 1..n, rem(n, 2) == 0, do: n
  end
end
