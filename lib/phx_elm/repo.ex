defmodule PhxElm.Repo do
  use Ecto.Repo,
    otp_app: :phx_elm,
    adapter: Ecto.Adapters.Postgres
end
