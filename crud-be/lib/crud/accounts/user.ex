defmodule Crud.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies_nitipat_users" do
    field :company_profile_id, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :mobile, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :first_name, :last_name, :mobile, :company_profile_id, :title])
    |> validate_required([:email, :first_name])
  end
end
