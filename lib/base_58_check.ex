defmodule Base58Check do
  alias Base58Check.Base58
  alias Base58Check.Base58Zero
  alias Base58Check.Base58Check

  @doc """
  Encodes the given integer.

  ## Examples

      iex> Base58Check.encode58(<<0>>)
      "1"

      iex> Base58Check.encode58(<<57>>)
      "z"

      iex> Base58Check.encode58(:binary.encode_unsigned(1024))
      "Jf"

      iex> Base58Check.encode58(:binary.encode_unsigned(123_456_789))
      "BukQL"
  """
  defdelegate encode58(binary), to: Base58, as: :encode

  @doc """
  Decodes the given string.

  ## Examples

      iex> Base58Check.decode58!("1")
      <<0>>

      iex> Base58Check.decode58!("z")
      <<57>>

      iex> Base58Check.decode58!("Jf")
      :binary.encode_unsigned(1024)

      iex> Base58Check.decode58!("BukQL")
      :binary.encode_unsigned(123_456_789)
  """
  defdelegate decode58!(string), to: Base58, as: :decode

  @doc """
  encode a binary into the specific bitcoin Base58 representation
  ## Examples

      iex> Base58Check.encode58zero(<<0,0,0,0,0,2,3,4,5>>)
      "111113yzKE"
  """
  defdelegate encode58zero(binary), to: Base58Zero, as: :encode

  @doc """
  decode a specific bitcoin Base58 representation into a binary

  ## Examples

      iex> Base58Check.decode58zero!("111113yzKE")
      <<0,0,0,0,0,2,3,4,5>>
  """
  defdelegate decode58zero!(string), to: Base58Zero, as: :decode

  @doc """
  encode a binary into the specific bitcoin Base58 representation
  with checksum

  ## Examples

      iex> Base58Check.encode58check(<<200, 37, 161, 236, 242, 166, 131, 12, 68, 1, 98, 12, 58, 22, 241, 153, 80, 87, 194, 171>>, :p2pkh, :main)
      "1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY"
  """
  defdelegate encode58check(binary, type, network), to: Base58Check, as: :encode

  @doc """
  decode a specific bitcoin Base58 representation
  with checksum to a binary

      iex> Base58Check.decode58check!("1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY")
      <<200, 37, 161, 236, 242, 166, 131, 12, 68, 1, 98, 12, 58, 22, 241, 153, 80, 87, 194, 171>>
  """
  defdelegate decode58check!(string), to: Base58Check, as: :decode
end
