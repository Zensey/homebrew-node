# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class MysteriumNode < Formula
  desc "Run exit node of Mysterium Network"
  homepage "http://mysterium.network"
  url "https://github.com/Zensey/homebrew-node/archive/refs/tags/1.0.1.zip"

  depends_on cask: "docker"

  def install
    bin.install "bin/m4b"
  end
end