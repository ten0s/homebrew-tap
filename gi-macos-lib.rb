class GiMacosLib < Formula
  desc "MacOS Lib via GObject Introspection"
  homepage "https://github.com/ten0s/gi-macos-lib"
  url "https://github.com/ten0s/gi-macos-lib/archive/refs/tags/0.2.0.tar.gz"
  sha256 "3c8396f0017822a3de18ca6ebd41a6b876d8d837c8d7b4977d03ad98561763b1"
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
