defmodule InertiaSsrAdapters.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      InertiaSsrAdaptersWeb.Telemetry,
      InertiaSsrAdapters.Repo,
      {DNSCluster, query: Application.get_env(:inertia_ssr_adapters, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: InertiaSsrAdapters.PubSub},
      # Start a worker by calling: InertiaSsrAdapters.Worker.start_link(arg)
      # {InertiaSsrAdapters.Worker, arg},
      # Start to serve requests, typically the last entry
      InertiaSsrAdaptersWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InertiaSsrAdapters.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InertiaSsrAdaptersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
