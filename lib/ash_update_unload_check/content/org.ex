defmodule AshUpdateUnloadCheck.Content.Org do
  use Ash.Resource,
    otp_app: :ash_update_unload_check,
    domain: AshUpdateUnloadCheck.Content,
    data_layer: AshPostgres.DataLayer

  actions do
    defaults [:read, :destroy, create: :*, update: :*]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      public? true
    end
  end

  relationships do
    has_many :authors, AshUpdateUnloadCheck.Content.Author
  end

  postgres do
    table "orgs"
    repo AshUpdateUnloadCheck.Repo
  end
end
