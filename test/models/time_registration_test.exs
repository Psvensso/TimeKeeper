defmodule TimeKeeper.TimeRegistrationTest do
  use TimeKeeper.ModelCase

  alias TimeKeeper.TimeRegistration

  @valid_attrs %{in: "2010-04-17 14:00:00", out: "2010-04-17 14:00:00", person_id: 1, workplace_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TimeRegistration.changeset(%TimeRegistration{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TimeRegistration.changeset(%TimeRegistration{}, @invalid_attrs)
    refute changeset.valid?
  end
end
