class Codemap < Formula
  desc "Generate a brain map of your codebase for LLM context"
  homepage "https://github.com/JordanCoin/codemap"
  version "2.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JordanCoin/codemap/releases/download/v2.9.0/codemap-darwin-arm64.tar.gz"
      sha256 "dc0f880a5ae38bfb3375587fb13f3fc5875eb5c24922023f128728b2932dc30a"
    else
      url "https://github.com/JordanCoin/codemap/releases/download/v2.9.0/codemap-darwin-amd64.tar.gz"
      sha256 "68e8e5d69a05962db8580fbcbc596f2e3af76b29bbf2d1d6afe5d88a9c150999"
    end
  end

  def install
    bin.install "codemap"
    (libexec/"grammars").install Dir["grammars/*"] if Dir.exist?("grammars")
    (libexec/"queries").install Dir["queries/*"] if Dir.exist?("queries")
  end

  def caveats
    <<~EOS
      Tree-sitter grammars installed to:
        #{libexec}/grammars

      For --deps mode, codemap will find them automatically.
    EOS
  end

  test do
    system "#{bin}/codemap", "--help"
  end
end
