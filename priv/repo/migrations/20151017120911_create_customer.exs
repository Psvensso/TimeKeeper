defmodule TimeKeeper.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :desc, :string
      add :workplace_id, :integer

      timestamps
    end

  end
end
