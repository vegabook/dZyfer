defmodule DZyfer.Repo do
  use Ecto.Repo,
    otp_app: :dZyfer,
    adapter: Ecto.Adapters.Postgres
end
