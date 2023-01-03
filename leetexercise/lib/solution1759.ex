defmodule Solution do
  @spec count_homogenous(s :: String.t()) :: integer
  def count_homogenous(s) do
    s
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.map(&get_cnt(elem(&1, 1)))
    |> Enum.sum()
  end

  defp get_cnt(n) do
    div((1 + n) * n, 2)
  end
end

res = Solution.count_homogenous("aaabbbcccc")
IO.inspect(res)
