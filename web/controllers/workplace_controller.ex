defmodule TimeKeeper.WorkplaceController do
  use TimeKeeper.Web, :controller

  alias TimeKeeper.Workplace

  plug :scrub_params, "workplace" when action in [:create, :update]

  def index(conn, _params) do
    workplaces = Repo.all(Workplace)
    render(conn, "index.json", workplaces: workplaces)
  end

  def create(conn, %{"workplace" => workplace_params}) do
    changeset = Workplace.changeset(%Workplace{}, workplace_params)

    case Repo.insert(changeset) do
      {:ok, workplace} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", workplace_path(conn, :show, workplace))
        |> render("show.json", workplace: workplace)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TimeKeeper.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    workplace = Repo.get!(Workplace, id)
    render(conn, "show.json", workplace: workplace)
  end

  def update(conn, %{"id" => id, "workplace" => workplace_params}) do
    workplace = Repo.get!(Workplace, id)
    changeset = Workplace.changeset(workplace, workplace_params)

    case Repo.update(changeset) do
      {:ok, workplace} ->
        render(conn, "show.json", workplace: workplace)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TimeKeeper.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    workplace = Repo.get!(Workplace, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(workplace)

    send_resp(conn, :no_content, "")
  end
end
