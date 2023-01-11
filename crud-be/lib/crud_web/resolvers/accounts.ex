defmodule CrudWeb.Resolvers.Accounts do
  def all_users(_parent, _args, _resolution) do
    {:ok, Crud.Accounts.list_companies_nitipat_users()}
  end

  def create_user(_parent, args, _resolution) do
    case Crud.Accounts.create_user(args) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def get_user(_parent, args, _resolution) do
    case Crud.Accounts.get_user(args.id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp get_user_to_update_user(id) do
    case Crud.Accounts.get_user(id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def update_user(_parent, args, _resolution) do
    with {:ok, user} <- get_user_to_update_user(args.id),
         {:ok, user} <- Crud.Accounts.update_user(user, args) do
      {:ok, user}
    else
      {:error, changeset} -> {:error, changeset}
    end
  end
end
