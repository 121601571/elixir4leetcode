defmodule Solution do
  @spec find_length_of_lcis(nums :: [integer]) :: integer
  def find_length_of_lcis(nums) do
      find_length_of_lcis(nums, -1000000000, 0,0)
  end
  
  defp find_length_of_lcis(nums, prev, cnt, maxsofar) when length(nums) == 0 do
    max(cnt, maxsofar)
  end
  
  defp find_length_of_lcis(nums, prev, cnt, maxsofar) do
    [head|tail] = nums
    if head > prev do
      find_length_of_lcis(tail, head, cnt + 1, max(cnt+1, maxsofar))
    else 
      find_length_of_lcis(tail, head, 1, maxsofar)
    end
  end
end
  
  
end