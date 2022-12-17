defmodule Solution do
  @spec count_consistent_strings(allowed :: String.t, words :: [String.t]) :: integer
  def count_consistent_strings(allowed, words) do
    words
    |> Enum.filter(fn (x) -> isOK(x, allowed) == true end)
    |> Enum.count()
  end
  
  defp isOK(word, temp) do
    ll = String.graphemes(word)
    Enum.all?(&(&1 in temp))
  end
end