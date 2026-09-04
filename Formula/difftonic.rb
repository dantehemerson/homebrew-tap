class Difftonic < Formula
  desc "Fast syntax-highlighted terminal diff renderer for LazyGit"
  homepage "https://github.com/dantehemerson/difftonic"
  version "0.1.2"
  license "MIT"

  on_macos do
    url "https://github.com/dantehemerson/difftonic/releases/download/v0.1.2/difftonic-v0.1.2-universal-apple-darwin.tar.gz"
    sha256 "6b80c66cd7049fe14643dd6b76b9cfd8c80397ad25f6d77949b4826eba18c435"
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
