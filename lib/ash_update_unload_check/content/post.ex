defmodule AshUpdateUnloadCheck.Content.Post do
  use AshUpdateUnloadCheck.Content.BaseResource

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      public? true
    end

    attribute :published, :boolean do
      public? true
      default true
    end
  end

  relationships do
    belongs_to :author, AshUpdateUnloadCheck.Content.Author
  end

  postgres do
    table "posts"
    repo AshUpdateUnloadCheck.Repo
  end
end
