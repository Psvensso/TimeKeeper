defmodule TimeKeeper.ProfileController do
  use TimeKeeper.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end