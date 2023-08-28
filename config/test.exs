import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sticky, StickyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "clDlqVCcgN/moFIYKWx4T+3zUTiM2H2GgLSR2T8ag84DghEVI33I8tuUR2Kk5EFE",
  server: false

# In test we don't send emails.
config :sticky, Sticky.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
