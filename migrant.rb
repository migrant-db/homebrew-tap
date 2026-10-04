class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/migrant-db/migrant"
  version "v1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.1/migrant-cli-macos-arm64"
      sha256 "6741883007c6820d74e09538a487ddf5fd81624836904ec3f6ca989da8aa073c"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.1/migrant-cli-macos-x64"
      sha256 "e7f413ca4eea80656e23b24fb832e6603cd499030275d1da6fd6ae924985caed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.1/migrant-cli-linux-arm64"
      sha256 "eff87abd2c299326cb5471a82cfa09bb1178a3efde03e3d6499d15485043271e"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.1/migrant-cli-linux-x64"
      sha256 "bd3e5b0155a48dfd378b4605a16d389e93d7d8929a9899284a3775ac08bbcf33"
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
