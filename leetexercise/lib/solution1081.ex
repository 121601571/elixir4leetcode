defmodule Solution1081 do
  @spec smallest_subsequence(s :: String.t()) :: String.t()
  def smallest_subsequence(s) do
    ll1 = length(String.graphemes(s) |> Enum.uniq())
    pattern = String.graphemes(s) |> Enum.uniq() |> Enum.sort()

    for x <- 0..String.length(s) do
      res = getAns(s, x, pattern, ll1)
    end
    |> Enum.filter(&(&1 != ""))
    |> Enum.sort()
    |> Enum.at(0)
  end

  defp getAns(s, curL, pattern, n) do
    cur1 = String.slice(s, curL..(curL + n - 1))
    IO.inspect(cur1)

    if String.length(cur1) < curL do
      ""
    else
      ll1 = String.graphemes(cur1) |> Enum.uniq() |> Enum.sort()

      if ll1 == pattern do
        cur1
      else
        ""
      end
    end
  end
end

IO.inspect(Solution1081.smallest_subsequence("cbacdcbc"))
