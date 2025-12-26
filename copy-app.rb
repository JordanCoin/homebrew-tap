class CopyApp < Formula
  desc "Capture any macOS app window to clipboard with a single command"
  homepage "https://github.com/JordanCoin/copy-app"
  url "https://github.com/JordanCoin/copy-app/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bdced82ea26c39fb62ba453b2705e149f951a7715e916debf70b34cbbff93a43"
  license "MIT"

  depends_on :macos

  def install
    bin.install "copy-app.sh" => "copy-app"
  end

  def caveats
    <<~EOS
      copy-app requires Accessibility permission for your terminal.

      Grant permission in:
        System Settings → Privacy & Security → Accessibility

      Add your terminal app (Terminal, iTerm, Warp, etc.) and restart it.
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/copy-app --help")
  end
end
