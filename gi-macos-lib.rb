class GiMacosLib < Formula
  desc "MacOS Lib via GObject Introspection"
  homepage "https://github.com/ten0s/gi-macos-lib"
  url "https://github.com/ten0s/gi-macos-lib/archive/refs/tags/1.2.0.tar.gz"
  sha256 "faf0a0dabc8f5e7e2421fea949c28d877794a3a35c2829a5dbfc0a8abe764522"
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
