defmodule InertiaSsrAdapters.Repo do
  use Ecto.Repo,
    otp_app: :inertia_ssr_adapters,
    adapter: Ecto.Adapters.Postgres
end
