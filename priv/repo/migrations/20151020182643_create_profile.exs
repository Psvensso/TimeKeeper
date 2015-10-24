defmodule TimeKeeper.Repo.Migrations.CreateProfile do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string

      timestamps
    end

  end
end
