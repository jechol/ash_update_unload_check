defmodule AshUpdateUnloadCheck.Content.BaseResource do
  defmacro __using__(opts) do
    extensions = opts |> Keyword.get(:extensions, [])
    extensions = [AshArchival.Resource | extensions]
    opts = opts |> Keyword.put(:extensions, extensions)

    quote do
      use Ash.Resource, unquote(opts)
    end
  end
end
