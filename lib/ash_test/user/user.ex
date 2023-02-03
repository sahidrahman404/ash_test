defmodule AshTest.User.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource, AshGraphql.Resource]

  graphql do
    type(:user)

    queries do
      get(:get_user, :read)
    end

    mutations do
      create(:create_user, :create_user)
    end
  end

  postgres do
    table("users")
    repo(AshTest.Repo)
  end

  actions do
    defaults([:read, :create])

    create :create_user do
      argument :account_id, :uuid do
        # This action requires representative_id
        allow_nil?(false)
      end

      change(manage_relationship(:account_id, :account, type: :append_and_remove))
    end
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
