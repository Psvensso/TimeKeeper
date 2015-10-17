defmodule TimeKeeper.TimeRegistrationController do
  use TimeKeeper.Web, :controller

  alias TimeKeeper.TimeRegistration

  plug :scrub_params, "time_registration" when action in [:create, :update]

  def index(conn, _params) do
    time_registrations = Repo.all(TimeRegistration)
    render(conn, "index.json", time_registrations: time_registrations)
  end

  def create(conn, %{"time_registration" => time_registration_params}) do
    changeset = TimeRegistration.changeset(%TimeRegistration{}, time_registration_params)

    case Repo.insert(changeset) do
      {:ok, time_registration} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", time_registration_path(conn, :show, time_registration))
        |> render("show.json", time_registration: time_registration)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TimeKeeper.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    time_registration = Repo.get!(TimeRegistration, id)
    render(conn, "show.json", time_registration: time_registration)
  end

  def update(conn, %{"id" => id, "time_registration" => time_registration_params}) do
    time_registration = Repo.get!(TimeRegistration, id)
    changeset = TimeRegistration.changeset(time_registration, time_registration_params)

    case Repo.update(changeset) do
      {:ok, time_registration} ->
        render(conn, "show.json", time_registration: time_registration)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TimeKeeper.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_registration = Repo.get!(TimeRegistration, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(time_registration)

    send_resp(conn, :no_content, "")
  end
end
