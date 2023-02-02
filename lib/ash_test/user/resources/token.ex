defmodule AshTest.User.Token do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource, AshGraphql.Resource, AshAuthentication.TokenResource]

  postgres do
    table("tokens")
    repo(AshTest.Repo)
  end

  token do
    api(AshTest.User)
  end
end
