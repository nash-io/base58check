defmodule Base58Check.Base58Zero do
  @moduledoc """
  Implement slightly modified version of Base58 where leading 0 are not trimmed
  """

  alias Base58Check.Base58

  @padding_char Base58.encode(<<0>>)

  @spec encode(binary()) :: String.t()
  def encode(payload) do
    leading_zeros = leading_zeros(payload)
    String.duplicate(@padding_char, leading_zeros) <> Base58.encode(payload)
  end

  @spec decode(String.t()) :: binary()
  def decode(payload) do
    trimmed_payload = String.trim_leading(payload, @padding_char)
    leading_zeros = byte_size(payload) - byte_size(trimmed_payload)
    String.duplicate(<<0>>, leading_zeros) <> Base58.decode(trimmed_payload)
  end

  @spec leading_zeros(binary()) :: integer()
  defp leading_zeros(payload), do: leading_zeros(payload, 0)
  defp leading_zeros(<<0, remaining::binary>>, acc), do: leading_zeros(remaining, acc + 1)
  defp leading_zeros(_, acc), do: acc
end
