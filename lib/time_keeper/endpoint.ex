defmodule TimeKeeper.Endpoint do
  use Phoenix.Endpoint, otp_app: :time_keeper



  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :time_keeper, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt jspm_packages config.js)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  #plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart,:json],
    pass: ["*/*"],
    json_decoder: Poison

  # converts the request method to PUT, PATCH or DELETE for POST requests with a valid _method parameter
  plug Plug.MethodOverride

  #converts HEAD requests to GET requests and strips the response body
  plug Plug.Head

  #a plug that sets up session management.
  #Note that fetch_session/2 must still be explicitly called before using the session as this plug just sets up how the session is fetched
  plug Plug.Session,
  store: :cookie,
  key: "_time_keeper_key",
  signing_salt: "XshTD8gS"

  #plugs a router into the request cycle
  plug TimeKeeper.Router


end
