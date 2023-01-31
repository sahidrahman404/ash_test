import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ash_test, AshTestWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base:
    "VTrCEsmKzSPKWzNAwrW942TUjl1bc9bBAiLPoyvTH/8lbXokZAmJ/gcMbELESft+",
  server: false

# In test we don't send emails.
config :ash_test, AshTest.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :ash_test, AshTest.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash_test_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
