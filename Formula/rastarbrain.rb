class Rastarbrain < Formula
  desc "Self-hosted personal knowledge manager for notes, tasks, and review workflows"
  homepage "https://github.com/raghavendra-talur/rastarbrain"
  url "https://github.com/raghavendra-talur/rastarbrain/releases/download/v0.3.0/rastarbrain-server-darwin-arm64.tar.gz"
  version "0.3.0"
  sha256 "e323e4b5b546e6d1f462a4b45824cc1cbc8455aac770f7e81b93c8fced193596"
  license :cannot_represent

  def install
    odie "rastarbrain Homebrew installs currently support Apple Silicon macOS only." unless Hardware::CPU.arm?

    bin.install "bin/rastarbrain"
  end

  service do
    run [opt_bin/"rastarbrain", "--port", "9002"]
    keep_alive true
    log_path var/"log/rastarbrain.log"
    error_log_path var/"log/rastarbrain.log"
  end

  def caveats
    <<~EOS
      Start the server with:
        brew services start rastarbrain

      Then open:
        http://127.0.0.1:9002

      If the UI asks for an admin token:
        rastarbrain admin-token --raw
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rastarbrain version")
  end
end
