defmodule AshTestWeb.Router do
  use AshTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AshTestWeb do
    pipe_through :api
  end

  scope "/api/json" do
    pipe_through(:api)

    forward "/ashtest", AshTestWeb.Support.Router
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:ash_test, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
