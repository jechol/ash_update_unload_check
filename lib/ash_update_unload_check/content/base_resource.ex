defmodule AshUpdateUnloadCheck.Content.BaseResource do
  defmacro __using__(opts) do
    quote do
      use Ash.Resource, unquote(opts)
    end
  end
end
