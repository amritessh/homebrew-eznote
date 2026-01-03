class Eznote < Formula
  desc "Zero-friction note taking for developers who live in the terminal"
  homepage "https://github.com/amritessh/eznote"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/amritessh/eznote/releases/download/v0.1.0/ezn-macos-aarch64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  -"
    else
      url "https://github.com/amritessh/eznote/releases/download/v0.1.0/ezn-macos-x86_64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  -"  
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/amritessh/eznote/releases/download/v0.1.0/ezn-linux-aarch64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  -"
    else
      url "https://github.com/amritessh/eznote/releases/download/v0.1.0/ezn-linux-x86_64"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  -"  
    end
  end

  def install
    binary = if OS.mac?
      if Hardware::CPU.arm?
        "ezn-macos-aarch64"
      else
        "ezn-macos-x86_64"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        "ezn-linux-aarch64"
      else
        "ezn-linux-x86_64"
      end
    end

    bin.install binary => "ezn"
  end

  test do
    assert_match "ezn", shell_output("#{bin}/ezn --version")
  end
end
