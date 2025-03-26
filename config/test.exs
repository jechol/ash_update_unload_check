import Config

config :logger, level: :warning
config :ash, disable_async?: true

config :ash_update_unload_check, AshUpdateUnloadCheck.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash_update_unload_check_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
