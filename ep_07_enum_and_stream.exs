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
end
