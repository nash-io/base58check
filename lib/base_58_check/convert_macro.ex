defmodule Base58Check.ConvertMacro do
  defmacro create_funs(alphabet) do
    alphabet = Enum.with_index(to_charlist(alphabet))

    for {x, index} <- alphabet do
      quote do
        def char_to_index(unquote(x)), do: unquote(index)
        def index_to_char(unquote(index)), do: unquote(x)
      end
    end
  end
end
