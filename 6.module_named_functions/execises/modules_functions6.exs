#The most efficient way to find the number is to guess halfway between the low and high numbers of the range. If our guess is too big, then the answer lies between the bottom of the range and one less than our guess. If it is too small, then the answer lies between one more than our guess and the end of the range.

#Code this up. Your API will be guess(actual, range), where range is an Elixir range.

#Your output should look similar to:

#iex> Chop.guess(273, 1..1000)
#Is it 500
#Is it 250
#Is it 375
#Is it 312
#Is it 281
#Is it 265
#Is it 273
#273
#Hints:

defmodule Chop do 
  def guess(actual, range = low..high) do 
    guess = div(low+high,2)
    IO.puts "Is is #{guess}?"
    _guess(actual,guess,range)
  end


  defp _guess(actual,guess,_low..high) 
    when guess < actual,
    do: guess(actual,guess+1..high)

  defp _guess(actual,guess,low.._high)
    when guess > actual,
    do: guess(actual,low..guess-1)
  defp _guess(_actual,guess, _), do: IO.puts "Yes, it's #{guess}"
end

Chop.guess(273,1..1000)
