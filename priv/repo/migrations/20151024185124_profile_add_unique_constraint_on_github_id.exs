defmodule TimeKeeper.Repo.Migrations.ProfileAddUniqueConstraintOnGithubId do
  use Ecto.Migration

  def change do
      create unique_index(:profiles, [:github_id]);
  end
end
