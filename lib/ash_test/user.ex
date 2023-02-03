defmodule AshTest.User do
  use Ash.Api, extensions: [AshJsonApi.Api, AshGraphql.Api]

  resources do
    # This defines the set of resources that can be used with this API
    registry(AshTest.User.Registry)
  end
end
