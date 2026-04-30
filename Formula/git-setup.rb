class GitSetup < Formula
  desc "Automated & non-destructive Git, SSH, and GPG environment setup for macOS"
  homepage "https://github.com/henchoznoe/GitSetup"
  url "https://github.com/henchoznoe/GitSetup/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "9471e2e3d6edfdceb148b883edb7aa2c2fe1d6432cc3352577a0119b48a6c4fa"
  license "MIT"

  depends_on "node@22"
  depends_on "pnpm" => :build
  depends_on :macos

  def install
    system "pnpm", "install", "--frozen-lockfile"
    system "pnpm", "build"
    bin.install "dist/git-setup.js" => "git-setup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-setup --version")
  end
end
