defmodule AshUpdateUnloadCheck.Content.Author do
  use Ash.Resource,
    otp_app: :ash_update_unload_check,
    domain: AshUpdateUnloadCheck.Content,
    data_layer: AshPostgres.DataLayer

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
