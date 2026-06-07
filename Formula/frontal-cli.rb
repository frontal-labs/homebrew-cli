class FrontalCli < Formula
  desc "Frontal CLI"
  homepage "https://github.com/frontal-labs/cli"
  url "https://github.com/frontal-labs/cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7552414a38fbef36e2e8b6f3614b4e905577024c25c5393b2269f270ade0f764"
  license "MIT"
  head "https://github.com/frontal-labs/cli.git", branch: "main"

  depends_on "bun"

  def install
    system "bun", "install", "--frozen-lockfile"
    system "bun", "run", "build"
    bin.install "dist/bin/frontal.js" => "frontal"
    chmod 0755, bin/"frontal"
  end

  test do
    assert_match "Frontal CLI", shell_output("#{bin}/frontal --version")
    assert_match "Frontal CLI", shell_output("#{bin}/frontal --help")
  end
end
