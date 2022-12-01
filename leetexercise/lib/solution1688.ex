defmodule Solution1688 do
  @spec number_of_matches(n :: integer) :: integer
  def number_of_matches(n) when n == 1 do
    0
  end

  def number_of_matches(n) when rem(n, 2) == 0 do
    div(n, 2) + number_of_matches(div(n, 2))
  end

  def number_of_matches(n) when rem(n, 2) == 1 do
    div(n - 1, 2) + number_of_matches(div(n + 1, 2))
  end
end
