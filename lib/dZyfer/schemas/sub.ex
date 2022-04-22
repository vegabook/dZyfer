defmodule DZyfer.Schemas.Sub do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime]

  schema "sub" do
    field :ticker, :string
    field :field, :string  # LAST_PRICE etc
    field :prov, :string   # eg bloomberg
    field :source, :string # live, historic etc
    field :period, :string # hourly, minute etc
    has_many :sample, DZyfer.Schemas.Sample
    timestamps()
  end

  def changeset(sub, params \\ %{}) do
    sub
    |> cast(params, [:ticker, :fields])
    |> validate_required([:ticker, :field, :prov, :source, :period])
  end

end


