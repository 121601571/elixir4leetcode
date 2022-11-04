defmodule Solution0014 do
  @spec longest_common_prefix(strs :: [String.t()]) :: String.t()
  def longest_common_prefix(strs) do
    ok = strs |> Enum.all?(&(String.length(&1) != 0))
    IO.inspect({strs, ok})

    if ok == false do
      ""
    else
      first = String.at(Enum.at(strs, 0), 0)
      ok = strs |> Enum.all?(&(String.at(&1, 0) == first))

      if ok == false do
        ""
      else
        newlist = strs |> Enum.map(&String.slice(&1, 1..-1))
        first <> longest_common_prefix(newlist)
      end
    end
  end
end

res = Solution0014.longest_common_prefix(["flower", "flow", "flight"])
IO.inspect(res)
