defmodule AshTest.Support.Representative do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshGraphql.Resource]

  graphql do
    type(:representative)

    queries do
      # <- create a field called `get_ticket` that uses the `read` read action to fetch a single post
      get(:get_rep, :read)

      # <- create a field called `list_tickets` that uses the `read` read action to fetch a list of posts
      list(:list_rep, :read)
    end

    mutations do
      # And so on
      create(:create_rep, :create)
    end
  end

  postgres do
    table("representatives")
    repo(AshTest.Repo)
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
    has_many(:tickets, AshTest.Support.Ticket)
  end

  code_interface do
    define_for(AshTest.Support)

    define(:create, args: [:name])
  end
end
