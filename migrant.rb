class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/as3hr/migrant"
  version "v1.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.0.8/migrant-cli-macos-arm64"
      sha256 "f873c0271959de03fdb214394fd0e84b9ad802196119aa5eb3448e51be76c078"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.0.8/migrant-cli-macos-x64"
      sha256 "79498b2dfd0cf14d82e4d366b6f43bc6638f8e3a632952da64e230259d585cd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.0.8/migrant-cli-linux-arm64"
      sha256 "b8c3e02ff4a85c88a7b5b265be103d115364df7ebe07510c0150259cd1824f6d"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.0.8/migrant-cli-linux-x64"
      sha256 "b4201c594cb169b4d4c68fdc56d550bfad706b70d3a3ca4178cd7f509e2170eb"
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
