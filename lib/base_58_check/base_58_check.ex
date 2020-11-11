defmodule Base58Check.Base58Check do
  @moduledoc """
  Implement slightly modified version of Base58 for bitcoin with
  checksum + type
  """

  alias Base58Check.Base58Zero

  @checksum_length 4

  # https://en.bitcoin.it/wiki/List_of_address_prefixes
  @address_prefixes %{
    p2pkh: %{
      main: <<0x00>>,
      test: <<0x6F>>
    },
    p2sh: %{
      main: <<0x05>>,
      test: <<0xC4>>
    }
  }

  @type address_type :: :p2pkh | :p2wpkh | :multi_sig
  @type network :: :main | :test

  @spec encode(binary(), address_type(), network()) :: String.t()
  def encode(payload, type, network) do
    address_type = if type == :p2pkh, do: :p2pkh, else: :p2sh

    payload
    |> append(@address_prefixes[address_type][network])
    |> add_checksum()
    |> Base58Zero.encode()
  end

  @spec decode(String.t()) :: binary()
  def decode(payload) do
    payload
    |> Base58Zero.decode()
    |> binary_part(1, 20)
  end

  @spec add_checksum(binary()) :: binary()
  defp add_checksum(payload) do
    payload
    |> double_sha256()
    |> binary_part(0, @checksum_length)
    |> append(payload)
  end

  @spec append(binary(), binary()) :: binary()
  defp append(data1, data2), do: data2 <> data1

  defp double_sha256(x), do: :crypto.hash(:sha256, :crypto.hash(:sha256, x))
end
