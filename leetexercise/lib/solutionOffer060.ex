defmodule SolutionOffer060 do
  @spec top_k_frequent(nums :: [integer], k :: integer) :: [integer]
  def top_k_frequent(nums, k) do
    Enum.frequencies(nums)
    |> Enum.map(fn {k, v} ->
      {k, v}
    end)
    |> Enum.sort_by(&(-elem(&1, 1)))
    |> Enum.map(&elem(&1, 0))
    |> Enum.take(k)
  end
end

res = SolutionOffer060.top_k_frequent([1, 1, 1, 2, 2, 3], 2)
IO.inspect(res)
