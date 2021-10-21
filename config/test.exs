import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :book_keeper, BookKeeper.Repo,
  username: "postgres",
  password: "postgres",
  database: "book_keeper_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :book_keeper, BookKeeperWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "caB2Uh/UVNlMV6GHYCw3gk40wFEyryyWMq21Ll7Vu7wdjBDQaYzes8/uT3Rnfbpq",
  server: false

# In test we don't send emails.
config :book_keeper, BookKeeper.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
