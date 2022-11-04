defmodule Solution0009 do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) do
    change2Str(x)
    |> checkOK()
  end

  defp change2Str(x) do
    Integer.to_string(x)
  end

  defp checkOK(str1) do
    if String.length(str1) <= 1 do
       true
    else
      if String.at(str1, 0) != String.at(str1, -1) do
        false
      else
        checkOK(String.slice(str1, 1..-2))
      end
    end
  end

end

IO.inspect(Solution0009.is_palindrome(12321))
