defmodule AshTest.User.Account do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication, AshGraphql.Resource]

  graphql do
    type(:account)

    queries do
      list(:list_account, :read)
      get(:sign_in, :sign_in_with_password)
    end

    mutations do
      create(:create_account, :register_with_password)
    end
  end

  postgres do
    table("accounts")
    repo(AshTest.Repo)
  end

  actions do
    defaults([:read])
  end

  attributes do
    uuid_primary_key(:id)
    create_timestamp(:created_at)
    update_timestamp(:updated_at)

    attribute :username, :string do
      allow_nil?(false)
    end

    attribute :email, :ci_string do
      allow_nil?(false)
    end

    attribute :hashed_password, :string do
      sensitive?(true)
      allow_nil?(false)
    end
  end

  authentication do
    api(AshTest.User)

    strategies do
      password :password do
        identity_field(:email)
      end
    end

    tokens do
      enabled?(true)
      token_resource(AshTest.User.Token)

      signing_secret("")
    end
  end

  identities do
    identity(:unique_email, [:email])
    identity(:unique_username, [:username])
  end

  relationships do
    has_one(:user, AshTest.User.User)

    has_many :ticket, AshTest.Support.Ticket do
      api(AshTest.Support)
    end
  end
end
