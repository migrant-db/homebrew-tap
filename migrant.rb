class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/migrant-db/migrant"
  version "v1.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.2/migrant-cli-macos-arm64"
      sha256 "4a1873c9583d6832e16593de544f03befefc502e309e59d01bcf894e7cda9f4d"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.2/migrant-cli-macos-x64"
      sha256 "bd28831e911afcff03094c4901564bf06740cb63c1b3ecbaccd60646ffb7d048"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.2/migrant-cli-linux-arm64"
      sha256 "742e1ebb8d54cffdd26bbafe57bd314bdffb4a0aaa11948998fe9e287b5de2a4"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.2/migrant-cli-linux-x64"
      sha256 "b0fae4b7132335c428a53b27a17c9b32535ed0b85b6a536cbc983620cb5a0292"
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
