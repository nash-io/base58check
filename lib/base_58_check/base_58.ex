defmodule Base58Check.Base58 do
  alias Base58Check.ConvertMacro

  require ConvertMacro

  ConvertMacro.create_funs("123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz")

  @spec encode(binary()) :: String.t()
  def encode(x), do: encode(:binary.decode_unsigned(x), <<>>)

  defp encode(0, <<>>), do: <<index_to_char(0)>>
  defp encode(0, acc), do: acc

  defp encode(x, acc) do
    encode(div(x, 58), <<index_to_char(rem(x, 58)), acc::binary>>)
  end

  @spec decode(String.t()) :: binary()
  def decode(enc), do: :binary.encode_unsigned(decode(enc, 0))

  defp decode(<<>>, acc), do: acc

  defp decode(<<c, rest::binary>>, acc) do
    decode(rest, acc * 58 + char_to_index(c))
  end
end
