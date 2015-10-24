defmodule TimeKeeper.AuthController do
  use TimeKeeper.Web, :controller

  @doc """
  This action is reached via `/auth/:provider` and redirects to the OAuth2 provider
  based on the chosen strategy.
  """
  def index(conn, %{"provider" => provider}) do
    redirect conn, external: authorize_url!(provider)
  end

  def logout(conn, _) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(conn, %{"provider" => provider, "code" => code}) do
    # Exchange an auth code for an access token
    token = get_token!(provider, code)

    # Request the user's data with the access token
    usr = get_user!(provider, token)
    user = Dict.put(usr, "provider", provider)
    #IO.puts "###### ID ########"
    #IO.puts user["id"]
    #IO.puts "###### USER ######"
    #IO.inspect(user)
    #IO.puts "###### Profile ###"
    #IO.inspect(TimeKeeper.Security.get_profile(user["id"], :github))
    #IO.puts "###### END #######"

    conn
    |> put_session(:provider_user, user)
    |> put_session(:access_token, token.access_token)
    |> redirect(to: "/")
  end

  defp authorize_url!("github"), do: GitHub.authorize_url!
  #defp authorize_url!("google"), do: Google.authorize_url!
  defp authorize_url!(_), do: raise "No matching provider available"

  defp get_token!("github", code), do: GitHub.get_token!(code: code)
  #defp get_token!("google", code), do: Google.get_token!(code: code)
  defp get_token!(_, _), do: raise "No matching provider available"

  #URL: api.github.com/user
  defp get_user!("github", token), do: OAuth2.AccessToken.get!(token, "/user")
  #defp get_user!("google", token), do: OAuth2.AccessToken.get!(token, "/user")
end
