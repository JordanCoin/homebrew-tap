class Crap4swift < Formula
  desc "Change Risk Anti-Patterns (CRAP) metric for Swift"
  homepage "https://github.com/JordanCoin/crap4swift"
  url "https://github.com/JordanCoin/crap4swift/releases/download/v0.1.0/crap4swift-macos.tar.gz"
  sha256 "4bcaf176c325f68e86717b81e2b6a7545dae2e5e3cb6907f247a1dd6774878a7"
  license "MIT"
  version "0.1.0"

  depends_on :macos

  def install
    bin.install "crap4swift"
  end

  test do
    assert_match "Change Risk Anti-Patterns", shell_output("#{bin}/crap4swift --help")
  end
end
