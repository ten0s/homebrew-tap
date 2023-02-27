class Slide < Formula
  desc "AutoCAD slide library and command line utility"
  homepage "https://github.com/ten0s/slide"
  url "https://github.com/ten0s/slide/archive/refs/tags/0.5.0.tar.gz"
  sha256 "7694dc4a357a40c6cb8c2d63ebaba4d776108ba242e8d1eee489c719a817fc89"
  license "GPL-3.0-or-later"

  depends_on "atk"        => :build
  depends_on "boost"      => :build
  depends_on "fribidi"    => :build
  depends_on "gdk-pixbuf" => :build
  depends_on "graphite2"  => :build
  depends_on "gtk+3"      => :build
  depends_on "harfbuzz"   => :build
  depends_on "libepoxy"   => :build
  depends_on "libjpeg"    => :build
  depends_on "libtiff"    => :build
  depends_on "pango"      => :build
  depends_on "pcre2"      => :build
  depends_on "pkg-config" => :build

  depends_on "glib"
  depends_on "gobject-introspection"

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
    prefix.install "LICENSE"
    prefix.install "README.md"
  end

  test do
    system "true"
  end
end
