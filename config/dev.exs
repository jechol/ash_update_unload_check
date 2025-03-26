import Config

config :ash_update_unload_check, AshUpdateUnloadCheck.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash_update_unload_check_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
