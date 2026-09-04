class Difftonic < Formula
  desc "Fast syntax-highlighted terminal diff renderer for LazyGit"
  homepage "https://github.com/dantehemerson/difftonic"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/dantehemerson/difftonic/releases/download/v0.1.1/difftonic-v0.1.1-universal-apple-darwin.tar.gz"
    sha256 "3bb56994a1ea945f6e371b5ff99355d73e17e5257233fa051ee7c9f03abcddea"
  end

  def install
    bin.install "difftonic"
  end

  test do
    (testpath/"test.patch").write <<~PATCH
      diff --git a/a.txt b/b.txt
      --- a/a.txt
      +++ b/b.txt
      @@ -1 +1 @@
      -old
      +new
    PATCH
    output = shell_output("git diff --no-color --no-index a.txt b.txt 2>/dev/null | #{bin}/difftonic --no-line-numbers || true")
    assert_match "+new", output
  end
end
