defmodule DZyfer.Repo.Migrations.Initial do
  use Ecto.Migration
  @timestamps_opts [type: :utc_datetime]

  # TODO foreign key on sample to sub
  # TODO 


  def change do

    create table ("sub") do
      add :ticker, :string, null: false
      add :field, :string, null: false
      add :source, :string, null: false
      add :period, :string, null: false
      add :prov, :string, null: false
      timestamps()
    end

    create table ("sample") do
      add :time, :utc_datetime, null: false
      add :close, :float, null: false
      add :high, :float
      add :low, :float
      timestamps()
    end

    create index(:sub, [:ticker])
    create index(:sub, [:field])
    create index(:sub, [:source])
    create index(:sub, [:period])
    create index(:sub, [:prov])
    create index(:sample, [:time])

  end
end
