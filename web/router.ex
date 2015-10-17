defmodule TimeKeeper.Router do
  use TimeKeeper.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    #plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimeKeeper do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TimeKeeper do
      pipe_through :api
      resources "/persons", PersonController
      resources "/time_registrations", TimeRegistrationController
      resources "/workplaces", WorkplaceController
      resources "/customers", CustomerController
  end
end
