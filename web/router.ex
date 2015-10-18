defmodule TimeKeeper.Router do
  use TimeKeeper.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimeKeeper do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    get "/profile", ProfileController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TimeKeeper do
      pipe_through :api
      resources "/persons", PersonController
      resources "/time_registrations", TimeRegistrationController
      resources "/workplaces", WorkplaceController
      resources "/customers", CustomerController
  end

  scope "/auth", TimeKeeper do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end
end
