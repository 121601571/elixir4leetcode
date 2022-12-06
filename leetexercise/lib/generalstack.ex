defmodule Generalstack do

  def start do
    {:ok, agent} = Agent.start_link fn -> [] end
  end



end
