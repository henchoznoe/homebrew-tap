class GitSetup < Formula
  desc "Automated & non-destructive Git, SSH, and GPG environment setup for macOS"
  homepage "https://github.com/henchoznoe/GitSetup"
  url "https://github.com/henchoznoe/GitSetup/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "47264c05a2cd05c6a6585f44e389dd4f39a62ec220dda3e815d54c656da5a2ca"
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
