defmodule AshUpdateUnloadCheck.Content do
  use Ash.Domain,
    otp_app: :ash_update_unload_check

  resources do
    resource AshUpdateUnloadCheck.Content.Org
    resource AshUpdateUnloadCheck.Content.Author
    resource AshUpdateUnloadCheck.Content.Post
  end
end
