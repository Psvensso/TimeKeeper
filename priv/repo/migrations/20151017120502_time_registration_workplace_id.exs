defmodule TimeKeeper.Repo.Migrations.TimeRegistrationWorkplaceId do
  use Ecto.Migration

  def change do
    alter table(:time_registrations) do
      add :workplace_id, :integer
    end
  end
end
