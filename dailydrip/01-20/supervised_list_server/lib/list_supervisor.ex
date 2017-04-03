defmodule ListSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, sup} = :supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(sup) do 
    # Start the ListData worker
    {:ok, list_data} = :supervisor.start_child(sup, worker(ListData, []))
    # Now Start the SubSupervisor fot the actual ListServer
    :supervisor.start_child(sup, worker(ListSubSupervisor, [list_data]))
  end

  def init(_) do
    #child_processes = [ worker(ListServer, list) ]
    supervise [], strategy: :one_for_one
    #supervise child_processes, strategy: :one_for_one
  end
end
