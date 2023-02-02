defmodule AshTest.User.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource, AshGraphql.Resource]

  postgres do
    table "users"
    repo AshTest.Repo
  end

  attributes do
    uuid_primary_key(:id)
    create_timestamp(:created_at)
    update_timestamp(:updated_at)

    attribute :name, :string do
      allow_nil?(false)
    end

    attribute(:bio, :string)

    attribute :sex, :atom do
      constraints(one_of: [:man, :woman, :non_binary])
      default(:non_binary)
    end
  end

  relationships do
    belongs_to(:account, AshTest.User.Account)
  end
end
