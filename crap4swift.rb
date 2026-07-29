class Crap4swift < Formula
  desc "Change Risk Anti-Patterns (CRAP) metric for Swift"
  homepage "https://github.com/JordanCoin/crap4swift"
  url "https://github.com/JordanCoin/crap4swift/releases/download/v0.1.1/crap4swift-macos.tar.gz"
  sha256 "ef6954120324bbb1e0b21f4e9b0da32f129be852f0ebca68391da758b09c2b42"
  license "MIT"
  version "0.1.1"

  depends_on :macos

  def install
    bin.install "crap4swift"
  end

  test do
    assert_match "Change Risk Anti-Patterns", shell_output("#{bin}/crap4swift --help")
  end
end
