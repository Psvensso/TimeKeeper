defmodule TimeKeeper.Repo.Migrations.CreateTimeRegistration do
  use Ecto.Migration

  def change do
    create table(:time_registrations) do
      add :in, :datetime
      add :out, :datetime
      
      timestamps
    end

  end
end
