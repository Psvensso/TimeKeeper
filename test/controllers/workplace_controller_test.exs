defmodule TimeKeeper.WorkplaceControllerTest do
  use TimeKeeper.ConnCase

  alias TimeKeeper.Workplace
  @valid_attrs %{desc: "some content", location: "some content", name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, workplace_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    workplace = Repo.insert! %Workplace{}
    conn = get conn, workplace_path(conn, :show, workplace)
    assert json_response(conn, 200)["data"] == %{"id" => workplace.id,
      "name" => workplace.name,
      "location" => workplace.location,
      "desc" => workplace.desc}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, workplace_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, workplace_path(conn, :create), workplace: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Workplace, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, workplace_path(conn, :create), workplace: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    workplace = Repo.insert! %Workplace{}
    conn = put conn, workplace_path(conn, :update, workplace), workplace: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Workplace, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    workplace = Repo.insert! %Workplace{}
    conn = put conn, workplace_path(conn, :update, workplace), workplace: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    workplace = Repo.insert! %Workplace{}
    conn = delete conn, workplace_path(conn, :delete, workplace)
    assert response(conn, 204)
    refute Repo.get(Workplace, workplace.id)
  end
end
