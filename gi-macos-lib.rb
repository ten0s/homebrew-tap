class GiMacosLib < Formula
  desc "MacOS Lib via GObject Introspection"
  homepage "https://github.com/ten0s/gi-macos-lib"
  url "https://github.com/ten0s/gi-macos-lib/archive/refs/tags/1.0.0.tar.gz"
  sha256 "cbeb647d3f0e7c0f9cea8f8aceccf32b0065a6c227b98a8e75d58a8ae9a13724"
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
