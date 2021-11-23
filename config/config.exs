# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :addressbook,
  ecto_repos: [Addressbook.Repo]

# Configures the endpoint
config :addressbook, AddressbookWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: AddressbookWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Addressbook.PubSub,
  live_view: [signing_salt: "fLnLwzwj"]

config :addressbook, Addressbook.Guardian,
  issuer: "Addressbook API",
  secret_key: "Zr85xpKqVn3kg1+sDo8wAKt19bg9+yQ6/+iHhLYSgrqUpbnBPPkT3krcXJNgEfcH"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
