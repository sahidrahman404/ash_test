# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :ash_test, AshTestWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: AshTestWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: AshTest.PubSub,
  live_view: [signing_salt: "aoTAv9OB"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :ash_test, AshTest.Mailer, adapter: Swoosh.Adapters.Local

## ash
config :ash_test,
  ash_apis: [AshTest.Support, AshTest.User]

config :ash_test,
  ecto_repos: [AshTest.Repo]

config :mime, :types, %{
  "application/vnd.api+json" => ["json"]
}

config :ash_test, 
  :use_all_identities_in_manage_relationship?, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
