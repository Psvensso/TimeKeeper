defmodule TimeKeeper.PersonControllerTest do
  use TimeKeeper.ConnCase

  alias TimeKeeper.Person
  @valid_attrs %{firstName: "some content", lastName: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, person_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = get conn, person_path(conn, :show, person)
    assert json_response(conn, 200)["data"] == %{"id" => person.id,
      "firstName" => person.firstName,
      "lastName" => person.lastName}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, person_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, person_path(conn, :create), person: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Person, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, person_path(conn, :create), person: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = put conn, person_path(conn, :update, person), person: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Person, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = put conn, person_path(conn, :update, person), person: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    person = Repo.insert! %Person{}
    conn = delete conn, person_path(conn, :delete, person)
    assert response(conn, 204)
    refute Repo.get(Person, person.id)
  end
end
