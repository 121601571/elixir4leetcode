defmodule Solution do
  @spec maximum_value(strs :: [String.t]) :: integer
  def maximum_value(strs) do
    strs
    |> Enum.map(
      fn x -> getAns(x)  end
    )
    |> Enum.max()

  end

  defp getAns(x) do
    q1 = String.graphemes(x)
    ok = Enum.any?(q1, fn x -> x in String.graphemes("qwertyuiopasdfghjklzxcvbnm") end)
    if ok do
      String.length(x)
    else

      String.to_integer(x)
    end

  end

  defp getS2(n) do
    String.length(n)
  end

  defp getS1(n) do
    String.to_integer(n)
  end

end
