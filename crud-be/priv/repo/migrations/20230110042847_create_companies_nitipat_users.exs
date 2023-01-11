defmodule Crud.Repo.Migrations.CreateCompaniesNitipatUsers do
  use Ecto.Migration

  def change do
    create table(:companies_nitipat_users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :mobile, :string
      add :company_profile_id, :string
      add :title, :string

      timestamps()
    end
  end
end
