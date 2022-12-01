defmodule Solution1092 do
  @spec shortest_common_supersequence(str1 :: String.t, str2 :: String.t) :: String.t
  def shortest_common_supersequence(str1, str2) do
    if String.length(str1) == 0 or String.length(str2) == 0 do
      if String.length(str1) == 0 do
        str2
      else
        str1
      end
    else
      if String.at(str1, 0) == String.at(str2, 0) do
        String.at(str1, 0) <> shortest_common_supersequence(String.slice(str1, 1..-1), String.slice(str2, 1..-1))
      else
        v1 = String.at(str1, 0) <> shortest_common_supersequence(String.slice(str1, 1..-1), str2)
        v2 = String.at(str2, 0) <> shortest_common_supersequence(str1, String.slice(str2, 1..-1))
        if String.length(v1) <= String.length(v2) do
          v1
        else
          v2
        end
      end


    end
  end
end
a= Solution1092.shortest_common_supersequence(str1 = "abac", str2 = "cab")
IO.inspect(a)
