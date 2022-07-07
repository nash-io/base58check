defmodule Base58Check.Mixfile do
  use Mix.Project

  def project do
    [
      app: :base_58_check,
      version: "1.0.0",
      elixir: "~> 1.0",
      description: "Base58Check and Base58 encoding/decoding for Elixir",
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:crypto]
    ]
   end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "base_58_check",
      contributors: ["Adrien Moreau"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nash-io/base58check"}
    ]
  end
end
