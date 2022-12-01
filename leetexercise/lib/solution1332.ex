defmodule Solution1332 do
  @spec remove_palindrome_sub(s :: String.t()) :: integer
  def remove_palindrome_sub(s) do
    if isOK(s) do
      1
    else
      2
    end
  end

  defp isOK(s) do
    if String.length(s) <= 1 do
      true
    else
      if String.at(s, 0) == String.at(s, -1) do
        isOK(String.slice(s, 1..-2))
      else
        false
      end
    end
  end
end
