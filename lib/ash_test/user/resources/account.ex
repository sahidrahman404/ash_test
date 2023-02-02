defmodule AshTest.User.Account do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource, AshGraphql.Resource, AshAuthentication]

  postgres do
    table("accounts")
    repo(AshTest.Repo)
  end

  actions do
    # Add a set of simple actions. You'll customize these later.
    defaults([:create, :read, :update, :destroy])
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

      signing_secret(
        "-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----"
      )
    end
  end

  identities do
    identity(:unique_email, [:email])
    identity(:unique_username, [:username])
  end

  relationships do
    has_one(:user, AshTest.User.User)
  end
end
