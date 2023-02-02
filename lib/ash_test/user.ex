defmodule AshTest.User do
  use Ash.Api, extensions: [AshJsonApi.Api, AshGraphql.Api]

  graphql do
    # Defaults to `true`, use this to disable authorization for the entire API 
    # (you probably only want this while prototyping)
    authorize?(false)
  end

  resources do
    # This defines the set of resources that can be used with this API
    registry(AshTest.User.Registry)
  end
end
