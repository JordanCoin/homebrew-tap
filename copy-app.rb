class CopyApp < Formula
  desc "Capture any macOS app window to clipboard with a single command"
  homepage "https://github.com/JordanCoin/copy-app"
  url "https://github.com/JordanCoin/copy-app/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "82c90ef628d78bfc83c950b6bd3d42344e9d75a583f62002ca43e9cc24e44c35"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/copy-app"
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
