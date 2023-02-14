class Libgimacos < Formula
  desc "MacOS Lib via GObject Introspection"
  homepage "https://github.com/ten0s/libgimacos"
  url "https://github.com/ten0s/libgimacos/archive/refs/tags/1.3.0.tar.gz"
  sha256 "b699ead65003c9239dd6e7a296c054475757b1a8cb8db564e1931c92332032e9"
  license "BSD-2-Clause"

  depends_on "pcre2" => :build
  depends_on "pkg-config" => :build
  depends_on "gjs" => :test

  depends_on "glib"
  depends_on "gobject-introspection"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
    prefix.install "test-gjs.js"
    prefix.install "LICENSE"
    prefix.install "README.md"
  end

  test do
    system "gjs", "#{prefix}/test-gjs.js"
  end
end
