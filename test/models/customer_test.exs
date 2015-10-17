defmodule TimeKeeper.CustomerTest do
  use TimeKeeper.ModelCase

  alias TimeKeeper.Customer

  @valid_attrs %{desc: "some content", name: "some content", workplace_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Customer.changeset(%Customer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Customer.changeset(%Customer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
