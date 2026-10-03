class Migrant < Formula
  desc "AI-powered engineering intelligence CLI for PostgreSQL databases"
  homepage "https://github.com/as3hr/migrant"
  version "v1.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.0.9/migrant-cli-macos-arm64"
      sha256 "13e077c41afb6b35435ebb021ff1eaa0dba7d48192481a3d04b9feef7b859b27"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.0.9/migrant-cli-macos-x64"
      sha256 "7cf245c6fb3b64f90be3e5f3aa512f8ff0dcb24952bb7dad4962fe3c99b130e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/as3hr/migrant/releases/download/v1.0.9/migrant-cli-linux-arm64"
      sha256 "d0954520d07772e8df5e7acaab8b274c12fdb85922c325d4480647c6098a95c6"
    else
      url "https://github.com/as3hr/migrant/releases/download/v1.0.9/migrant-cli-linux-x64"
      sha256 "b3ef9ab843e2ce737c60f9261fe401988e75a78e7f501bb9616169a213ba38bb"
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
