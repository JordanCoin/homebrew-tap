class Codemap < Formula
  desc "Generate a brain map of your codebase for LLM context"
  homepage "https://github.com/JordanCoin/codemap"
  version "2.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JordanCoin/codemap/releases/download/v2.8.3/codemap-darwin-arm64.tar.gz"
      sha256 "fcf45010e21b8bd25be12161c6211a8fdaad380e3648bf920e6b02472f2dde43"
    else
      url "https://github.com/JordanCoin/codemap/releases/download/v2.8.3/codemap-darwin-amd64.tar.gz"
      sha256 "675362ddc4778ce8ed24b08ed5babbb7875797fc16cccfbf4a5ffaead9ee5924"
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
