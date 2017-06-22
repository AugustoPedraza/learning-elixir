defmodule Ep07EnumAndStream do
  """
    iex(2)> Stream.take(Ep07EnumAndStream.months, 12)
    #Stream<[enum: #Function<61.48026477/2 in Stream.unfold/2>,
     funs: [#Function<55.48026477/1 in Stream.take/2>]]>
    iex(3)> stream = Stream.take(Ep07EnumAndStream.months, 12)
    #Stream<[enum: #Function<61.48026477/2 in Stream.unfold/2>,
     funs: [#Function<55.48026477/1 in Stream.take/2>]]>
    iex(4)> Enum.to_list(stream)
    [:Jan, :Feb, :Mar, :May, :Apr, :Jun, :Jul, :Ago, :Sep, :Nov, :Dic, :Jan]
  """
  def months do
    Stream.cycle([:Jan, :Feb, :Mar, :May, :Apr, :Jun, :Jul, :Ago, :Sep, :Nov, :Dic])
  end

  def parse_file do
    "sample.txt"
      |> File.stream!
      |> Stream.filter(&(&1 != "\n"))
      |> Stream.filter(&starts_with_d/1)
      |> Stream.map(&format/1)
      |> Enum.to_list
      |> Enum.sort &(String.length(&1) < String.length(&2))
  end

  defp starts_with_d word do
    String.first(word) == "d"
  end

  defp format word do
    word
      |> String.trim
      |> String.capitalize
  end
end
