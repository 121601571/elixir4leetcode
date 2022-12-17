defmodule Solution do
  alias JasonVendored.Encode
  @spec num_matching_subseq(s :: String.t, words :: [String.t]) :: integer
  def num_matching_subseq(s, words) do
    words
    |> Enum.map(fn(x) -> isMatch(s, x)   end)
    |> Enum.filter(&(&1 == true))
    |> Enum.count()
  end

  defp isMatch(a,b) do
    if String.length(b) == 0 do
      true
    else
      if String.length(a) == 0 do
        false
      else
        if String.at(a, 0) == String.at(b, 0) do
          isMatch(String.slice(a, 1..-1), String.slice(b, 1..-1))
        else
          isMatch(String.slice(a, 1..-1), b)
        end
      end
    end

  end
end
