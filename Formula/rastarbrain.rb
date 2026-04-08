class Rastarbrain < Formula
  desc "Self-hosted personal knowledge manager for notes, tasks, and review workflows"
  homepage "https://github.com/raghavendra-talur/rastarbrain"
  url "https://github.com/raghavendra-talur/rastarbrain/releases/download/v0.5.0/rastarbrain-server-darwin-arm64.tar.gz"
  version "0.5.0"
  sha256 "d0e5a5032ddb950e2b82bfeac77d857545dfd3b9965b46073b8c513e441419cb"
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
