class GitlabHelper < Formula
  desc "CLI tool to make your life easier when working with GitLab"
  homepage "https://github.com/L7R7/gitlab-helper"
  url "https://github.com/L7R7/gitlab-helper.git", tag: "v0.0.24", revision: "131250e9fdc08a3b0ba4811a3f43ae9633e2a651"
  license "MIT"

  depends_on "haskell-stack" => [:build]

  def install
    system "make", "install"
    bin.install ".stack-work/dist/aarch64-osx/ghc-9.6.5/build/gitlab-helper-exe/gitlab-helper-exe" => "gitlab-helper-exe"
  end

  test do
    assert_equal "Version: v0.0.24",
      shell_output("#{bin}/gitlab-helper-exe --api-token 123 --group-id 123 --base-url https://foo.bar version")
    assert_equal true
  end
end
