defmodule Dstreams.Repo do
  use Ecto.Repo,
    otp_app: :dstreams,
    adapter: Ecto.Adapters.Postgres
end
