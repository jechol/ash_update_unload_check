defmodule AshUpdateUnloadCheck.Content do
  use Ash.Domain,
    otp_app: :ash_update_unload_check,
    extensions: [AshPaperTrail.Domain]

  paper_trail do
    include_versions?(true)
  end

  resources do
    resource AshUpdateUnloadCheck.Content.Author
    resource AshUpdateUnloadCheck.Content.Post
  end
end
