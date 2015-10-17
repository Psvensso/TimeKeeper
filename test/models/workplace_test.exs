defmodule TimeKeeper.WorkplaceTest do
  use TimeKeeper.ModelCase

  alias TimeKeeper.Workplace

  @valid_attrs %{workplace_id: 1, desc: "some content", location: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Workplace.changeset(%Workplace{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Workplace.changeset(%Workplace{}, @invalid_attrs)
    refute changeset.valid?
  end
end
