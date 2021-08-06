# typed: false
# frozen_string_literal: true

# Formula for Mysterium Network Node installation
class MysteriumNetworkNode < Formula
  desc "Run exit node of Mysterium Network"
  homepage "http://mysterium.network"
  url "https://github.com/Zensey/homebrew-node/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "f45c1eb2cf3d325cfa4c707ab1db8ec811092a2926b37434a39cf9fee5d12551"
  license ""

  def install
    bin.install "./bin/container.sh"
  end
end
