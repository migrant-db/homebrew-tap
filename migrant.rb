class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/as3hr/migrant"
  version "v1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.1.0/migrant-cli-macos-arm64"
      sha256 "c69d178c0e964685260ee5dbc0123e2a6668f33b8bbc2c19b06f7d372e7189df"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.1.0/migrant-cli-macos-x64"
      sha256 "a6707a6960691498ebc71e500b9e135c7313403be305b28e04efd6eb0362859f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.1.0/migrant-cli-linux-arm64"
      sha256 "26f1c31c3e8a21edcb58bb30db9d1cd67164dfd2adae43a47aeb5ef44781b36d"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.1.0/migrant-cli-linux-x64"
      sha256 "b070d09915a8afcfe47bd80d88e4ba713f60e167eecfebd78642b8e86063925f"
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
