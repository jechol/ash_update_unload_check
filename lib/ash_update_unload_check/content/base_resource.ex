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
    opts = opts |> Keyword.put(:extensions, extensions)

    quote do
      use Ash.Resource, unquote(opts)

      multitenancy do
        strategy :attribute
        attribute :org_id
      end

      relationships do
        belongs_to :org, AshUpdateUnloadCheck.Content.Org do
          allow_nil? false
          attribute_writable? false
          public? true
        end
      end
    end
  end
end
