defmodule TimeKeeper.TimeRegistrationControllerTest do
  use TimeKeeper.ConnCase

  alias TimeKeeper.TimeRegistration
  @valid_attrs %{in: "2010-04-17 14:00:00", out: "2010-04-17 14:00:00", person_id: 1, workplace_id: 1}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, time_registration_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    time_registration = Repo.insert! %TimeRegistration{}
    conn = get conn, time_registration_path(conn, :show, time_registration)
    assert json_response(conn, 200)["data"] == %{"id" => time_registration.id,
      "in" => time_registration.in,
      "out" => time_registration.out}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, time_registration_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, time_registration_path(conn, :create), time_registration: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(TimeRegistration, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, time_registration_path(conn, :create), time_registration: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    time_registration = Repo.insert! %TimeRegistration{}
    conn = put conn, time_registration_path(conn, :update, time_registration), time_registration: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(TimeRegistration, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    time_registration = Repo.insert! %TimeRegistration{}
    conn = put conn, time_registration_path(conn, :update, time_registration), time_registration: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    time_registration = Repo.insert! %TimeRegistration{}
    conn = delete conn, time_registration_path(conn, :delete, time_registration)
    assert response(conn, 204)
    refute Repo.get(TimeRegistration, time_registration.id)
  end
end
