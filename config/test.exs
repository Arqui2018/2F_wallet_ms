use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wallet_ms, WalletMsWeb.Endpoint,
  http: [port: 4004],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :wallet_ms, WalletMs.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "",
  database: "wallet_ms_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
