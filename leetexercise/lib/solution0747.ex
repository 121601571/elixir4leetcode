defmodule Solution0747 do
  @spec dominant_index(nums :: [integer]) :: integer
  def dominant_index(nums) do
    if length(nums) == 1 do
      -1
    else
      {a,b} = nums
      |> Enum.sort_by(&(-&1))
      |> {Enum.at(0), Enum.at(1)}
      if a >= 2*b do
        Enum.find_index(nums, fn x -> x == a end)
      else
        -1
      end

    end
  end
end
