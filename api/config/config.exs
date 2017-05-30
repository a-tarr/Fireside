# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fireside,
  ecto_repos: [Fireside.Repo]

# Configures the endpoint
config :fireside, Fireside.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3Nyb8+9p6TMMiTXPZ3yKkb5ECUmUjdZWN5KlYK8BL45uu/dbOJ30eHHgTLz92HXY",
  render_errors: [view: Fireside.ErrorView, accepts: ~w(json)],
  pubsub: [name: Fireside.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Fireside",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Fireside.GuardianSerializer  

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
