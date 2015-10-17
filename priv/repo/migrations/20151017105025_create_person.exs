defmodule TimeKeeper.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :firstName, :string
      add :lastName, :string

      timestamps
    end

  end
end
