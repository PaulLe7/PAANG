defmodule CrudWeb.Schema do
  use Absinthe.Schema

  alias CrudWeb.Resolvers

  object :user do
    field :id, :id
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :mobile, :string
    field :company_profile_id, :string
    field :title, :string
  end

  query do
    field :users, list_of(:user) do
      resolve &Resolvers.Accounts.all_users/3
    end

    field :get_user, :user do
      arg :id, non_null(:id)
      resolve &Resolvers.Accounts.get_user/3
    end
  end

  mutation do
    field :create_user, :user do
      arg :email, non_null(:string)
      arg :first_name, non_null(:string)
      arg :last_name, :string
      arg :mobile, :string
      arg :company_profile_id, :string
      arg :title, :string
      resolve &Resolvers.Accounts.create_user/3
    end

    field :update_user, :user do
      arg :id, non_null(:id)
      arg :email, non_null(:string)
      arg :first_name, non_null(:string)
      arg :last_name, :string
      arg :mobile, :string
      arg :company_profile_id, :string
      arg :title, :string
      resolve &Resolvers.Accounts.update_user/3
    end
  end
end
