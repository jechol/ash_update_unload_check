defmodule AshUpdateUnloadCheck.Content.AuthorTest do
  use AshUpdateUnloadCheck.DataCase
  doctest AshUpdateUnloadCheck.Content.Author
  alias AshUpdateUnloadCheck.Content.Author
  alias AshUpdateUnloadCheck.Content.Post

  test "loaded relationships remain loaded after update" do
    author =
      Author
      |> Ash.Changeset.for_create(:create, %{first_name: "foo", last_name: "bar"})
      |> Ash.create!()

    _post =
      Post
      |> Ash.Changeset.for_create(:create, %{title: "baz"})
      |> Ash.Changeset.manage_relationship(:author, author, type: :append_and_remove)
      |> Ash.create!()

    author = author |> Ash.load!(:posts)

    assert [%Post{}] = author.posts

    author = author |> Ash.Changeset.for_update(:update, %{first_name: "foo2"}) |> Ash.update!()

    assert [%Post{}] = author.posts
  end
end
