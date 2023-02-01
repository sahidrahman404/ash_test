defmodule AshTest.Support do
  use Ash.Api, extensions: [AshJsonApi.Api]

  resources do
    # This defines the set of resources that can be used with this API
    registry AshTest.Support.Registry
  end
end
