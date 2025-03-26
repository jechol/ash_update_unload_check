defmodule AshUpdateUnloadCheck.Content.AuthorTest do
  use AshUpdateUnloadCheck.DataCase
  doctest AshUpdateUnloadCheck.Content.Author
  alias AshUpdateUnloadCheck.Content.Org
  alias AshUpdateUnloadCheck.Content.Author
  alias AshUpdateUnloadCheck.Content.Post

  test "loaded relationships remain loaded after update" do
    org =
      Org
      |> Ash.Changeset.for_create(:create, %{name: "foo"})
      |> Ash.create!()

    ash_opts = [tenant: org.id]

    author =
      Author
      |> Ash.Changeset.for_create(:create, %{
        first_name: "foo",
        last_name: "bar",
        birthday: Date.utc_today()
      })
      |> Ash.create!(ash_opts)

    _post =
      Post
      |> Ash.Changeset.for_create(:create, %{title: "baz"})
      |> Ash.Changeset.manage_relationship(:author, author, type: :append_and_remove)
      |> Ash.create!(ash_opts)

    author = author |> Ash.load!(:posts)

    assert [%Post{}] = author.posts

    author =
      author |> Ash.Changeset.for_update(:update, %{birthday: nil}) |> Ash.update!()

    assert [%Post{}] = author.posts
  end
end
