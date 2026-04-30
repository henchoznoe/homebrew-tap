class GitSetup < Formula
  desc "Automated & non-destructive Git, SSH, and GPG environment setup for macOS"
  homepage "https://github.com/henchoznoe/GitSetup"
  url "https://github.com/henchoznoe/GitSetup/archive/refs/tags/v1.8.3.tar.gz"
  sha256 "c9db177adce8aaf06fc40e889b7a72ba9a348a87be70eebe68c7828b0135bfb4"
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
