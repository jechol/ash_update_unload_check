defmodule AshUpdateUnloadCheck.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [AshUpdateUnloadCheck.Repo]

    opts = [strategy: :one_for_one, name: AshUpdateUnloadCheck.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
