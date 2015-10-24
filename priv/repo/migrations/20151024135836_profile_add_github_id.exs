defmodule :"Elixir.TimeKeeper.Repo.Migrations.Profile.addGithubId" do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :github_id, :integer
    end
  end
end
