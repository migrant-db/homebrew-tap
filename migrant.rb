class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/migrant-db/migrant"
  version "v1.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-macos-arm64"
      sha256 "c517d740e42eb1169f1f80238adf3f9c009156c716d155f2345ff55df1ef145f"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-macos-x64"
      sha256 "1f9a2a8112c3b817017a17e2f6c2233f8c3419a06a2e0a55ee02d1709a7a5287"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-linux-arm64"
      sha256 "7f90cca908d1ff4375ad6aabd63b8669e93d9657470f1466ce204c1689f5ac95"
    else
      url "https://github.com/migrant-db/migrant/releases/download/v1.1.3/migrant-cli-linux-x64"
      sha256 "47da2740caa54b3831c66965b5f606b172bcb94c85b81a785899393aa10d14ab"
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
