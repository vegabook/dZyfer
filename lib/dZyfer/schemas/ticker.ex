defmodule DZyfer.Schemas.Ticker do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime]

    create table ("ticker") do
      add :ticker, :string, null: false
      add :field, references(:field, on_delete: :nothing)

      timestamps()
    end

  schema "ticker" do
    field :ticker, :string
    field :field, :string
    has_many :sample, DZyfer.Schemas.Sample
    belongs_to :field, Blog.Schemas.Field
    timestamps()
  end

  def changeset(ticker, params \\ %{}) do
    ticker
    |> cast(params, [:ticker, :field])
    |> validate_required([:ticker, :field])

  end
end


