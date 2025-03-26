defmodule AshUpdateUnloadCheck.Content.Author do
  use AshUpdateUnloadCheck.Content.BaseResource

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end

  preparations do
    prepare build(load: [:foo])
  end

  changes do
    change &noop/2, on: :create, only_when_valid?: true
  end

  attributes do
    uuid_primary_key :id

    attribute :birthday, :date, public?: true

    attribute :first_name, :string do
      public? true
    end

    attribute :last_name, :string do
      public? true
    end
  end

  relationships do
    has_many :posts, AshUpdateUnloadCheck.Content.Post do
      filter expr(published)
    end
  end

  calculations do
    calculate :foo, :boolean, expr(true)
  end

  postgres do
    table "authors"
    repo AshUpdateUnloadCheck.Repo
  end

  def noop(cs, _ctx) do
    cs
  end
end
