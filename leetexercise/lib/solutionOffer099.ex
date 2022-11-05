defmodule SolutionOffer099 do
  @spec min_path_sum(grid :: [[integer]]) :: integer
  def min_path_sum(grid) do
    OTPKV.start_link()
    OTPKV.clear()
    for x <-0..length(grid) do
      for y <-0..length(Enum.at(grid,0)) do
        curv1 = OTPKV.getK({x-1,y})
        curv2 = OTPKV.getK({x, y-1})
        curV = max(curv1, curv2) + Enum.at( Enum.at(grid, x), y)
        OTPKV.setK({x,y}, curV)
      end
    end
    OTPKV.getK({length(grid)-1, length(Enum.at(grid,0))-1})
  end
end

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
    {:reply, Map.get(state, key, 0), state}
  end

  def handle_call({:setK, key, value}, _from, state) do
    {:reply, %{}, Map.put(state, key, value)}
  end

  def handle_call({:reset}, _from, state) do
    {:reply, %{}, %{}}
  end
end
