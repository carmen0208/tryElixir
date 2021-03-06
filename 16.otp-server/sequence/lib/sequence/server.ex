defmodule Sequence.Server do
  use GenServer

  #####
  # External API
  def start_link(current_number) do 
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def next_number do 
    GenServer.call __MODULE__, :next_number
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  ####
  # GenServer implementation
  # Callback
  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number+1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, current_number + delta}
  end

  def format_status(_reason, [_pdict, state ]) do 
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end
end
#iex(1)> {:ok, pid} = GenServer.start_link(Sequence.Server, 100)
#{:ok, #PID<0.145.0>}
#iex(2)> GenServer.call(pid,:next_number)
#100
#iex(3)> GenServer.call(pid,:next_number)
#101
#iex(4)> GenServer.call(pid,:next_number)
#102
#iex(5)>
#
#
#Naming a process
#iex(5)> {:ok, pid} = GenServer.start_link(Sequence.Server, 100, name: :seq)
# {:ok, #PID<0.150.0>}
# iex(6)> GenServer.call(:seq, :next_number)
# 100
# iex(7)> :sys.get_status :seq
# {:status, #PID<0.150.0>, {:module, :gen_server},
#  [["$initial_call": {Sequence.Server, :init, 1}, "$ancestors": [#PID<0.143.0>]],
#   :running, #PID<0.143.0>, [],
#   [header: 'Status for generic server seq',
#    data: [{'Status', :running}, {'Parent', #PID<0.143.0>},
#     {'Logged events', []}],
#    data: [{'State', "My current state is '101', and I'm happy"}]]]}
#
#
# Provding External API
# iex(1)> Sequence.Server.start_link 123
# {:ok, #PID<0.119.0>}
#iex(2)> Sequence.Server.next_number
#123
#iex(3)> Sequence.Server.next_number
#124
#iex(4)> Sequence.Server.increment_number 100
#:ok
#iex(5)> Sequence.Server.next_number
#225
