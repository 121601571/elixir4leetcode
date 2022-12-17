defmodule Solution do
  @spec running_sum(nums :: [integer]) :: [integer]
  def running_sum(nums) do
  ans(nums,[], 0)
  end
  
  defp ans(nums, prev, last) when length(nums) == 0 do
    prev
  end
  
  defp ans(nums, prev, last) do
    [head|tail] = nums
    ans(tail, prev ++ [last+head], last+head)
    
  end
end

CREATE USER 'liyi'@'localhost' IDENTIFIED BY 'Sap12345';