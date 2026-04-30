class GitSetup < Formula
  desc "Automated & non-destructive Git, SSH, and GPG environment setup for macOS"
  homepage "https://github.com/henchoznoe/GitSetup"
  url "https://github.com/henchoznoe/GitSetup/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "135fa09eb142ceac0836ce37b1ef5f14ed08a2d893e32d1fececf8c71819fcfe"
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
