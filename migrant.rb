class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/as3hr/migrant"
  version "v1.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.0.6/migrant-cli-macos-arm64"
      sha256 "7773497d10b72465e354bce2d57c5a415d8dc4e9de0de83b0fac82ff27b5cb37"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.0.6/migrant-cli-macos-x64"
      sha256 "5aab03d6c7b14e3d75f3ef421b9f51446b25c53e3b5a276d52081eae28c97f0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.0.6/migrant-cli-linux-arm64"
      sha256 "c4de38fffcc79b0eaa57c558008114518a922b5a263e4f75dba845321c0d295f"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.0.6/migrant-cli-linux-x64"
      sha256 "f2a96f06548ac8523973441c2cc4e2fb5a505323338e8d0aaec650af08466c4e"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "migrant-cli-macos-arm64" => "migrant"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "migrant-cli-macos-x64" => "migrant"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "migrant-cli-linux-arm64" => "migrant"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "migrant-cli-linux-x64" => "migrant"
    end
  end

  test do
    system "#{bin}/migrant", "--version"
  end
end
