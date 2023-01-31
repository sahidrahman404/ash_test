defmodule AshTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AshTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AshTest.PubSub},
      # Start Finch
      {Finch, name: AshTest.Finch},
      # Start the Endpoint (http/https)
      AshTestWeb.Endpoint,
      # Start a worker by calling: AshTest.Worker.start_link(arg)
      # {AshTest.Worker, arg}
      AshTest.Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AshTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AshTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
