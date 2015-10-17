defmodule TimeKeeper.TimeRegistration do
  use TimeKeeper.Web, :model

  schema "time_registrations" do
    field :in, Ecto.DateTime
    field :out, Ecto.DateTime
    field :person_id, :integer
    field :workplace_id, :integer
    timestamps
  end

  @required_fields ~w(in out person_id workplace_id)
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
