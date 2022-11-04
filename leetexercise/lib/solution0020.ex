defmodule Solution0020 do
  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    is_validStr(s, 0, 0, 0, "")
  end

  defp is_validStr(s, cnt1, cnt2, cnt3, prev) do
    IO.inspect(s)

    if cnt1 < 0 or cnt2 < 0 or cnt3 < 0 do
      false
    else
      if String.length(s) == 0 do
        if cnt1 == 0 and cnt2 == 0 and cnt3 == 0 do
          true
        else
          false
        end
      else
        first = String.at(s, 0)

        if {"}", "{"} == {first, prev} or
             {"]", "["} == {first, prev} or
             {")", "("} == {first, prev} or
             "(" == first or
             "{" == first or
             "[" == first or
             "" == prev do
          case first do
            "(" -> is_validStr(String.slice(s, 1..-1), cnt1 + 1, cnt2, cnt3, first)
            "{" -> is_validStr(String.slice(s, 1..-1), cnt1, cnt2 + 1, cnt3, first)
            "[" -> is_validStr(String.slice(s, 1..-1), cnt1, cnt2, cnt3 + 1, first)
            ")" -> is_validStr(String.slice(s, 1..-1), cnt1 - 1, cnt2, cnt3, first)
            "}" -> is_validStr(String.slice(s, 1..-1), cnt1, cnt2 - 1, cnt3, first)
            "]" -> is_validStr(String.slice(s, 1..-1), cnt1, cnt2, cnt3 - 1, first)
          end
        else
          false
        end
      end
    end
  end
end

IO.inspect(Solution0020.is_valid("()[]"))
