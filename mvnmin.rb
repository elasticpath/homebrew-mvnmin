
require "formula"

class Mvnmin < Formula
  MVNMIN_VERSION = "1.0.2"
  desc "mvnmin - minimal maven builds"
  homepage "https://github.com/elasticpath/mvnmin"
  url "https://github.com/elasticpath/mvnmin/releases/download/mvnmin-#{MVNMIN_VERSION}/mvnmin-#{MVNMIN_VERSION}.zip"
  sha256 "4c6bd9035c4ed00432c5a52985dfc57e5d7da49e76aaf6da971f9d780ed213e4"
  head "git@github.com:elasticpath/mvnmin.git"

  def install
    inreplace "mvnmin" do |s|
      s.gsub! "##PREFIX##", "#{prefix}"
    end
    bin.install "mvnmin"
    prefix.install "mvnmin-#{MVNMIN_VERSION}-jar-with-dependencies.jar"
  end

  # Homebrew requires tests.
  test do
    assert_match "usage: mvmin.*", shell_output("#{bin}/mvmin --help", 0)
  end
end
