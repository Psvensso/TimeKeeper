defmodule GitHub do
  @moduledoc """
  An OAuth2 strategy for GitHub.
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  # Public API

  def client do
    OAuth2.Client.new([
      strategy: __MODULE__,
      client_id: "643c13bc853ceb0718c4",
      client_secret: "8b5b342fb1baea2c110bb346861088363c2235c5",
      redirect_uri: "http://lvh.me:4000/auth/github/callback",
      site: "https://api.github.com",
      authorize_url: "https://github.com/login/oauth/authorize",
      token_url: "https://github.com/login/oauth/access_token"
    ])
  end

  def authorize_url!(params \\ []) do
		IO.puts System.get_env("TIMEKEEPER_REDIRECT_URI")
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], headers \\ []) do
    OAuth2.Client.get_token!(client(), params)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
