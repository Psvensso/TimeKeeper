defmodule TimeKeeper.Repo.Migrations.PersonId do
  use Ecto.Migration

  def change do
    alter table(:time_registrations) do
      add :person_id, :integer
    end
  end
end
