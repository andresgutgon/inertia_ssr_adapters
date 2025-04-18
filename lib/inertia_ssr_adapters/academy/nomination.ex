defmodule InertiaSsrAdapters.Academy.Nomination do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nominations" do
    field :name, :string
    field :age, :integer
    field :year, :integer
    field :movie, :string
    field :won, :boolean, default: false
    field :gender, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(nomination, attrs) do
    nomination
    |> cast(attrs, [:name, :age, :year, :movie, :won, :gender])
    |> validate_required([:name, :age, :year, :movie, :won, :gender])
  end
end
