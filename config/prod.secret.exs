use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :wallet_ms, WalletMsWeb.Endpoint,
  secret_key_base: "y/E4/Yiu05795BTGrdf4Gc6mlvOD1k3UONA2LkvxtbfGABO/jgiLOAJB+PK+4qet"

# Configure your database
config :wallet_ms, WalletMs.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "apuesta",
  password: "1234",
  database: "wallet",
  hostname: "wallet_db",
  pool_size: 15
# config :wallet_ms, WalletMs.Repo,
#   adapter: Ecto.Adapters.MySQL,
#   username: "apuesta",
#   password: "1234",
#   database: "wallet",
#   hostname: "wallet_db",
#   pool_size: 10
