Base58Check
===========

This library implements 3 encoding: Base58, Base58Zero, Base58Check

Base58Check is a modified version of Base58 to be used for bitcoin addresses

- [Base58](http://en.wikipedia.org/wiki/Base58)
- [Base58Check](https://en.bitcoin.it/wiki/Base58Check_encoding)

Installation
------------

Base58Check is [available in Hex](https://hex.pm/packages/base_58_check), and can be installed
by adding `base_58_check` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:base_58_check, "~> 1.0"}
  ]
end
```

Usage
-----

```elixir
iex(1)> Base58Check.encode58(<<58, 222, 104, 177>>)
"2WGzDn"

iex(2)> Base58Check.decode58!("2WGzDn")
<<58, 222, 104, 177>>

iex(3)> Base58Check.encode58zero(<<0, 0, 0, 0, 0, 2, 3, 4, 5>>)
"111113yzKE"

iex(4)> Base58Check.decode58zero!("111113yzKE")
<<0, 0, 0, 0, 0, 2, 3, 4, 5>>

iex(5)> Base58Check.encode58check(<<200, 37, 161, 236, 242, 166, 131, 12, 68, 1, 98, 12, 58, 22, 241, 153, 80, 87, 194, 171>>, :p2pkh, :main)
"1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY"

iex(6)> Base58Check.decode58check!("1KFHE7w8BhaENAswwryaoccDb6qcT6DbYY")
<<200, 37, 161, 236, 242, 166, 131, 12, 68, 1, 98, 12, 58, 22, 241, 153, 80, 87, 194, 171>>
```
