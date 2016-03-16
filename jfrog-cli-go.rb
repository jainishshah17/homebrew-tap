# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class JfrogCliGo < Formula
  desc "a command-line interface for Jfrog Artifactory and Bintray"
  homepage "https://github.com/JFrogDev/jfrog-cli-go"
  url "https://github.com/JFrogDev/jfrog-cli-go/archive/1.0.1.tar.gz"
  sha256 "9189993c3201dc354a73fdbd5dfdecb8ae077ef06e2d3badc6ac6450e7c64eaa"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go", "get", "github.com/jfrogdev/jfrog-cli-go/..."
    system "go", "build", "-o", "#{bin}/jfrog", "github.com/jfrogdev/jfrog-cli-go/jfrog"
    
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test jfrog-cli-go`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
