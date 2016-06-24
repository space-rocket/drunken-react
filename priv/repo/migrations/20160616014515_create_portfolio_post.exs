defmodule DrunkenReact.Repo.Migrations.CreatePortfolioPost do
  use Ecto.Migration

  def change do
    create table(:portfolio_posts) do
      add :name, :string
      add :image, :string

      timestamps
    end

  end
end
