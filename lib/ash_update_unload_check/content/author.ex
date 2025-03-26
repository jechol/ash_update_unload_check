defmodule AshUpdateUnloadCheck.Content.Author do
  use AshUpdateUnloadCheck.Content.BaseResource, extensions: [AshStateMachine]

  state_machine do
    initial_states [:active]
    default_initial_state :active

    transitions do
      transition :deactivate, from: :active, to: :inactive
      transition :activate, from: :inactive, to: :active
    end
  end

  actions do
    defaults [:read, :destroy, create: :*]

    update :update do
      primary? true
      accept :*
      require_atomic? false
    end

    update :activate do
      change transition_state(:active)
    end

    update :deactivate do
      change transition_state(:inactive)
    end
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
