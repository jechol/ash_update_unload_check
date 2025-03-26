defmodule AshUpdateUnloadCheck.Content.Author do
  use Ash.Resource,
    otp_app: :ash_update_unload_check,
    domain: AshUpdateUnloadCheck.Content,
    data_layer: AshPostgres.DataLayer

  actions do
    defaults [
      :read,
      :destroy,
      create: [:first_name, :last_name],
      update: [:first_name, :last_name]
    ]
  end

  attributes do
    uuid_primary_key :id

    attribute :first_name, :string do
      public? true
    end

    attribute :last_name, :string do
      public? true
    end
  end

  relationships do
    has_many :posts, AshUpdateUnloadCheck.Content.Post
  end

  postgres do
    table "authors"
    repo AshUpdateUnloadCheck.Repo
  end
end
