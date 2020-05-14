defmodule LiveComponentTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # LiveComponentTest.Repo,
      # Start the Telemetry supervisor
      LiveComponentTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveComponentTest.PubSub},
      # Start the Endpoint (http/https)
      LiveComponentTestWeb.Endpoint
      # Start a worker by calling: LiveComponentTest.Worker.start_link(arg)
      # {LiveComponentTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveComponentTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveComponentTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
