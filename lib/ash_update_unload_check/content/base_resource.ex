defmodule AshUpdateUnloadCheck.Content.BaseResource do
  defmacro __using__(opts) do
    default_opts =
      quote do
        [
          otp_app: :ash_update_unload_check,
          domain: AshUpdateUnloadCheck.Content,
          data_layer: AshPostgres.DataLayer
        ]
      end

    opts = Keyword.merge(default_opts, opts)

    extensions = opts |> Keyword.get(:extensions, [])
    extensions = [AshArchival.Resource, AshPaperTrail.Resource | extensions]
    opts = opts |> Keyword.put(:extensions, extensions)

    quote do
      use Ash.Resource, unquote(opts)

      paper_trail do
        change_tracking_mode(:changes_only)
      end
    end
  end
end
