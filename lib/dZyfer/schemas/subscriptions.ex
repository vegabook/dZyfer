defmodule DZyfer.Schemas.Subscription do
  use Ecto.Schema

  schema "subscriptions" do
    field :ticker, :string
    field :field, :string, default: "LAST_PRICE"
  end
end
