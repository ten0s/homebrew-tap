class GiMacosLib < Formula
  desc "MacOS Lib via GObject Introspection"
  homepage "https://github.com/ten0s/gi-macos-lib"
  url "https://github.com/ten0s/gi-macos-lib/archive/refs/tags/1.1.0.tar.gz"
  sha256 "54da2120802b0f4d30f70592e6eeb260dfc7fc96c4d4ba05172f99012f7c77ee"
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
