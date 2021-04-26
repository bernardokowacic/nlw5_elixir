defmodule Imana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Imana.Repo,
      # Start the Telemetry supervisor
      ImanaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Imana.PubSub},
      # Start the Endpoint (http/https)
      ImanaWeb.Endpoint,
      # Start a worker by calling: Imana.Worker.start_link(arg)
      # {Imana.Worker, arg}
      Imana.Supplies.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Imana.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ImanaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
