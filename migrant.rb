class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/migrant-db/migrant"
  version "v1.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-macos-arm64"
      sha256 "4b1e019eb326ffaa3b4945aa6d651a6ffe9b032b43c97037e38925da386b6118"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-macos-x64"
      sha256 "356bfd4df5e99f6716b4e3e634f9093999d6e8423f8b2e9e66a362d74e3a68bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-linux-arm64"
      sha256 "9cf5739a7b6eaa8165d27f2b02e341e44a2d232afc5a8fbd7dae1d5e8cf2ab2f"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-linux-x64"
      sha256 "d2096abdd1efc82094ab0b67a70188aa67813982d4b9b1cb715f12232771e7c0"
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
