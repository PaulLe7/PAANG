defmodule Crud.AccountsTest do
  use Crud.DataCase

  alias Crud.Accounts

  describe "companies_nitipat_users" do
    alias Crud.Accounts.User

    import Crud.AccountsFixtures

    @invalid_attrs %{company_profile_id: nil, email: nil, first_name: nil, last_name: nil, mobile: nil, title: nil}

    test "list_companies_nitipat_users/0 returns all companies_nitipat_users" do
      user = user_fixture()
      assert Accounts.list_companies_nitipat_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{company_profile_id: "some company_profile_id", email: "some email", first_name: "some first_name", last_name: "some last_name", mobile: "some mobile", title: "some title"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.company_profile_id == "some company_profile_id"
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.mobile == "some mobile"
      assert user.title == "some title"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{company_profile_id: "some updated company_profile_id", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", mobile: "some updated mobile", title: "some updated title"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.company_profile_id == "some updated company_profile_id"
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.mobile == "some updated mobile"
      assert user.title == "some updated title"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
