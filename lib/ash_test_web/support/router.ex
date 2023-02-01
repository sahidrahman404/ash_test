defmodule AshTestWeb.Support.Router do
  use AshJsonApi.Api.Router,
    api: AshTest.Support,
    registry: AshTest.Support.Registry
end
