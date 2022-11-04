defmodule OTPKV do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def getK(key) do
    GenServer.call(__MODULE__, {:getK, key})
  end

  def setK(key, value) do
    GenServer.call(__MODULE__, {:setK, key, value})
  end

  def clear() do
    GenServer.call(__MODULE__, {:reset})
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call({:getK, key}, _from, state) do
    {:reply, Map.get(state, key, -1), state}
  end

  def handle_call({:setK, key, value}, _from, state) do
    {:reply, %{}, Map.put(state, key, value)}
  end

  def handle_call({:reset}, _from, state) do
    {:reply, %{}, %{}}
  end
end

defmodule Solution0001 do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    OTPKV.start_link()
    OTPKV.clear()

    nums
    |> Enum.with_index()
    |> Enum.each(fn {a, b} -> OTPKV.setK(a, b) end)

    {{a, b}, new} =
      nums
      |> Enum.with_index()
      |> Enum.map(fn {value, idx} -> {checkOK(idx, target - value), idx} end)
      |> Enum.filter(fn {{idx, res}, idx2} -> res == true end)
      |> Enum.at(0)

    [a, new]
  end

  defp checkOK(idx, target) do
    res = OTPKV.getK(target)

    if res == -1 do
      {res, false}
    else
      if idx == res do
        {res, false}
      else
        {res, true}
      end
    end
  end
end

IO.inspect(Solution0001.two_sum([3, 2, 95, 4, -3], 92))
