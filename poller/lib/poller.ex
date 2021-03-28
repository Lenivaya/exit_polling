defmodule Poller do
  use Application
  alias Poller.PollSupervisor
  
  def start(_type, _args) do
    children = [
      PollSupervisor,
      {Phoenix.PubSub, name: Poller.PubSub.server_name()}
    ]
    
    opts = [strategy: :one_for_one, name: Poller.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
end
