defmodule Solution2255 do
  @spec count_prefixes(words :: [String.t], s :: String.t) :: integer
  def count_prefixes(words, s) do
    words
    |> Enum.map( fn(x) -> String.starts_with?(s, x) == true  end)
    |> Enum.filter(&(&1 == true))
    |> Enum.count()
  end
end
