defmodule Solution do
  @spec remove_duplicates(s :: String.t) :: String.t
  def remove_duplicates(s) do
    ret = remove_duplicates2([], String.graphemes(s))
    Enum.reduce(ret, "", fn(x, acc)-> acc <> x end)
  end

  def remove_duplicates2(prev, s) when length(s) == 0 do
    prev
  end
  
  def remove_duplicates2(prev, s) do
    
    first = Enum.at(s, 0)
    second = Enum.at(s, 1)
    
    if first == second do
      rest = Enum.slice(2..-1)
      remove_duplicates2(prev ++ rest)
    else
      rest = Enum.slice(2..-1)
      remove_duplicates2(prev ++ [first] ++ [second], rest)
    end
    
  end
end