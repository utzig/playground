defmodule Chop do
  defp current_guess(actual, _range, value) when actual == value do
    IO.puts "Is it #{value}"
    IO.puts "#{actual}"
  end

  defp current_guess(actual, range, value) when value < actual do
    IO.puts "Is it #{value}"
    _min..max = range
    current_guess(actual, value..max, value + div(max - value, 2))
  end

  defp current_guess(actual, range, value) when value > actual do
    IO.puts "Is it #{value}"
    min.._max = range
    current_guess(actual, min..value, min + div(value - min, 2))
  end

  def guess(actual, range) do
    min..max = range
    current_guess(actual, range, min + div(max - min, 2))
  end
end
