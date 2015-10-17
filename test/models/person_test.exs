defmodule TimeKeeper.PersonTest do
  use TimeKeeper.ModelCase

  alias TimeKeeper.Person

  @valid_attrs %{firstName: "some content", lastName: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Person.changeset(%Person{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end
