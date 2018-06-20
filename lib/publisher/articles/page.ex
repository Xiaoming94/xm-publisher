defmodule Publisher.Articles.Page do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pages" do
    field :body, :string
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :body, :slug])
    |> validate_required([:title, :body, :slug])
    |> unique_constraint(:slug)
  end
end
