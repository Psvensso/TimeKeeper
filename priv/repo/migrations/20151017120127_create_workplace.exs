defmodule TimeKeeper.Repo.Migrations.CreateWorkplace do
  use Ecto.Migration

  def change do
    create table(:workplaces) do
      add :name, :string
      add :location, :string
      add :desc, :string

      timestamps
    end

  end
end
