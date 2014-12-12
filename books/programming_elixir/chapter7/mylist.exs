defmodule MyList do
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def mapsum([], _func), do: 0
  def mapsum([h|t], func), do: func.(h) + mapsum(t, func)
end
