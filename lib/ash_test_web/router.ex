defmodule AshTestWeb.Router do
  use AshTestWeb, :router
  use AshAuthentication.Phoenix.Router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:load_from_bearer)
  end

  scope "/api", AshTestWeb do
    pipe_through(:api)
  end

  scope "/api/json" do
    pipe_through(:api)

    forward("/ashtest", AshTestWeb.Support.Router)
    sign_out_route(AshTestWeb.ApiAuthController)
    auth_routes_for(AshTest.User.Account, to: AshTestWeb.ApiAuthController)
  end

  scope "/" do
    forward("/gql", Absinthe.Plug, schema: AshTestWeb.Support.Schema)

    forward(
      "/playground",
      Absinthe.Plug.GraphiQL,
      schema: AshTestWeb.Support.Schema,
      interface: :playground
    )
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:ash_test, :dev_routes) do
    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
