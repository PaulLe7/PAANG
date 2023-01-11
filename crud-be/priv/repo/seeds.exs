# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Crud.Repo.insert!(%Crud.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Crud.Repo.insert!(%Crud.User{email: "", first_name: "John", last_name: "Doe", mobile: "1234567890", company_profile_id: "Yahoo", title: "CEO"})
Crud.Repo.insert!(%Crud.User{email: "", first_name: "Barack", last_name: "Obama", mobile: "1234567890", company_profile_id: "USA", title: "Ex-CEO"})
