class CopyApp < Formula
  desc "Capture any macOS app window to clipboard with a single command"
  homepage "https://github.com/JordanCoin/copy-app"
  url "https://github.com/JordanCoin/copy-app/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "396c484eace2e1cebb21fcf51dfda1f673ab970a4397f0f51869a1521d590075"
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
