defmodule Solution0816 do
  @spec ambiguous_coordinates(s :: String.t()) :: [String.t()]
  def ambiguous_coordinates(s) do
    ori = String.slice(s, 1..-2)

    ll =
      for x <- 0..(String.length(ori) - 2) do
        {String.slice(ori, 0..x), String.slice(ori, (x + 1)..-1)}
      end

    ll
    |> Enum.map(fn x -> {parseFirst(elem(x, 0)) and parseFirst(elem(x, 1)), x} end)
    |> Enum.filter(fn {ok, ret} ->
      with ok <- true do
        ret
      end
    end)
    |> Enum.map(fn {ok, x} -> packRes(x) end)
  end

  defp packRes({a,b}) do
    "(" <> a <> ", " <> b <> ")"
  end


  defp parseFirst(str1) do
    if String.length(str1) == 1 do
      true
    else
      if String.at(str1, 1) == "0" do
        false
      else
        if String.at(str1, -1) == "0" do
          false
        else
          true
        end
      end
    end
  end

  defp parseSecond(str1) do
    parseFirst(str1)
  end
end

IO.inspect(Solution0816.ambiguous_coordinates("(123)"))
