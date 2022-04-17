defmodule DZyfer.Repo.Migrations.Initial do
  use Ecto.Migration


  def change do

    create table ("field") do
      add :field, :string, null: false
    end

    create table ("ticker") do
      add :ticker, :string, null: false
      add :field, references(:field, on_delete: :nothing)
      timestamps()
    end

    create table ("sample") do
      add :ticker, references(:ticker, on_delete: :nothing)
      add :field, references(:field, on_delete: :nothing)
      add :source, :string, null: false
      add :period, :string, null: false
      add :time, :utc_datetime, null: false
      add :high, :float
      add :low, :float
      add :close, :float
      timestamps()
    end

    create index(:ticker, [:ticker])
    create index(:sample, [:ticker, :field, :source])

  end
end
