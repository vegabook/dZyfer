defmodule DZyfer.Schemas.Field do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime]

  schema "field" do
    field :ticker, :string
    has_many :ticker, DZyfer.Schemas.Ticker
    has_many :sample, DZyfer.Schemas.Sample

    timestamps()
  end

  def changeset(field, params \\ %{}) do
    field
    |> cast(params, [:ticker])
    |> validate_required([:ticker])
  end
end


