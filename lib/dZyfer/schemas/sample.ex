defmodule DZyfer.Schemas.Sample do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime]


  schema "sample" do
    field :time, :utc_datetime
    field :high, :float
    field :low, :float
    field :close, :float
    belongs_to :sub, Blog.Schemas.Sub
    timestamps()
  end

  def changeset(sample, params \\ %{}) do
    sample
    |> cast(params, [:time, :high, :low, :close])
    |> validate_required([:time, :close])
  end

end


