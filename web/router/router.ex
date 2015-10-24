defmodule TimeKeeper.Router do
  use TimeKeeper.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :check_has_profile
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
    resources "/profiles", ProfileController
    get "/profile/register", ProfileController, :register
    get "/profile/logout", AuthController, :logout
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
  def assign_current_user(conn, _) do
      assign(conn, :provider_user, get_session(conn, :provider_user))
        |> assign(:current_user, get_session(conn, :current_user))
  end

  def check_has_profile(conn, _) do
    provideruser = get_session(conn, :provider_user)
    profile = get_session(conn, :current_user)

    if provideruser != nil && profile == nil && conn.request_path != "/profile/register" do
      conn
        |> redirect(to: "/profile/register")
        |> halt
    end

    conn
  end


end
