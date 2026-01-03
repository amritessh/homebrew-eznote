class Eznote < Formula
  desc "Zero-friction note taking for developers who live in the terminal"
  homepage "https://github.com/amritessh/eznote"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/amritessh/eznote/releases/download/v0.1.1/ezn-macos-aarch64"
      sha256 "e8c606933fcf117eba358863cf8e242c6407cef6c73e04467065f3cd80627616"
    else
      url "https://github.com/amritessh/eznote/releases/download/v0.1.1/ezn-macos-x86_64"
      sha256 "f1c78df1b69d7c92f630a821bfa5f6855ba7464626d9aab3995b58ddee68dc7c"
    end
  end

  on_linux do
    url "https://github.com/amritessh/eznote/releases/download/v0.1.1/ezn-linux-x86_64"
    sha256 "f13b6c3a694b8556680d9a802a2286714b8163be1511e70eee7a17cf37a637ea"
  end

  def install
    binary = if OS.mac?
      if Hardware::CPU.arm?
        "ezn-macos-aarch64"
      else
        "ezn-macos-x86_64"
      end
    elsif OS.linux?
      "ezn-linux-x86_64"
    end

    bin.install binary => "ezn"
  end

  test do
    assert_match "ezn", shell_output("#{bin}/ezn --version")
  end
end
