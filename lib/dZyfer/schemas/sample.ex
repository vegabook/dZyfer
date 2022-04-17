defmodule DZyfer.Schemas.Sample do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime]


  schema "sample" do
    field :ticker, :string
    field :field, :string
    field :source, :string
    field :period, :string
    field :time, :utc_datetime
    field :high, :float
    field :low, :float
    field :close, :float
    timestamps()

    belongs_to :ticker, Blog.Schemas.Ticker

    timestamps()
  end

  def changeset(sample, params \\ %{}) do
    sample
    |> cast(params, [:ticker, :field, :source, :period, 
      :time, :high, :low, :close])
    |> validate_required([:ticker])
    |> validate_required([:field])
    |> validate_required([:source])
    |> validate_required([:period])
    |> validate_required([:time])
    |> validate_required([:time, :low, :close])

  end

end


