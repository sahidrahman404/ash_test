defmodule AshTest.Support.Representative do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "representatives"
    repo AshTest.Repo
  end

  actions do
    defaults([:create, :read, :update, :destroy])
  end

  attributes do
    uuid_primary_key(:id)
    create_timestamp(:created_at)
    update_timestamp(:updated_at)
    attribute(:name, :string)
  end

  relationships do
    has_many :tickets, AshTest.Support.Ticket
  end

  code_interface do
    define_for(AshTest.Support)

    define(:create, args: [:name])
  end
end
