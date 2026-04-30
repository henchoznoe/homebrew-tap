class GitSetup < Formula
  desc "Automated & non-destructive Git, SSH, and GPG environment setup for macOS"
  homepage "https://github.com/henchoznoe/GitSetup"
  url "https://github.com/henchoznoe/GitSetup/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "7a714980971863ff712c9d668c46ca43811eb7aa6b64538679331fd410effe17"
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
