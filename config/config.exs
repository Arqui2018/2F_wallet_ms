# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wallet_ms,
  ecto_repos: [WalletMs.Repo]

# Configures the endpoint
config :wallet_ms, WalletMsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jBVfBB3PBBW2MA0SbwzekX/TlCxpVsq2Ncub7+glNcc6wn1Ue4GI/EW9Xcotb60o",
  render_errors: [view: WalletMsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WalletMs.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
