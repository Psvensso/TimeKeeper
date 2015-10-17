defmodule TimeKeeper.Customer do
  use TimeKeeper.Web, :model

  schema "customers" do
    field :name, :string
    field :desc, :string
    field :workplace_id, :integer

    timestamps
  end

  @required_fields ~w(name desc workplace_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
