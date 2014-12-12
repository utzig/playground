defmodule MyList do
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def mapsum([], _func), do: 0
  def mapsum([h|t], func), do: func.(h) + mapsum(t, func)

  # returns max element in a list
  def max([h|t]), do: _max(t, h)

  defp _max([], value), do: value
  defp _max([h|t], value) when h > value, do: _max(t, h)
  defp _max([_h|t], value), do: _max(t, value)

  # caesar cypher!
  def caesar(list, n), do: _caesar(list, n)

  # TODO: find out how to use 'a', 'z' instead of 97, 122!
  defp _caesar([], _n), do: []
  defp _caesar([h|t], n) when (122 - h) > n, do: [(h + n) | _caesar(t, n)]
  defp _caesar([h|t], n), do: [((n - (122 - h) - 1) + 97) | _caesar(t, n)]
end
