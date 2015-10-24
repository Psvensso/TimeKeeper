defmodule TimeKeeper.Security do
	alias TimeKeeper.Repo
	import Ecto.Model
	import Ecto.Query, only: [from: 1, from: 2]
	import Plug.Conn

	def get_profile(name, providerAtom) do
			do_get_profile(name, providerAtom)
	end

	def get_provider_id(conn) do
		user = get_session(conn, :provider_user)
		user["id"]
	end

	defp do_get_profile(term, providerAtom) do
		case providerAtom do
   		:github ->
				query = from w in TimeKeeper.Profile,
		          where: w.github_id == ^term,
		         select: w
 		end

    Repo.all(query)
  end


end
