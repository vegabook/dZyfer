defmodule DZyfer.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :ticker, :string, null: false
      add :field, :string, default: "LAST_PRICE"
    end

  end
end
