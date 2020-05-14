defmodule LiveComponentTest.Repo do
  use Ecto.Repo,
    otp_app: :live_component_test,
    adapter: Ecto.Adapters.Postgres
end
