defmodule Solution0217 do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate(nums) do
    length(Enum.uniq(nums)) != length(nums)
  end
end
