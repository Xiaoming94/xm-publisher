defmodule Publisher.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :title, :string
      add :body, :text
      add :slug, :string

      timestamps()
    end

    create unique_index(:pages, [:slug])
  end
end
