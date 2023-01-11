defmodule Crud.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crud.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        company_profile_id: "some company_profile_id",
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        mobile: "some mobile",
        title: "some title"
      })
      |> Crud.Accounts.create_user()

    user
  end
end
