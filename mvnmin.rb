
require "formula"

class Mvnmin < Formula
  MVNMIN_VERSION = "1.0.1"
  desc "mvnmin - minimal maven builds"
  homepage "https://github.com/elasticpath/mvnmin"
  https://github.com/elasticpath/mvnmin/releases/download/mvnmin-1.0.1/mvnmin-1.0.1.zip
  url "https://github.com/elasticpath/mvnmin/releases/download/mvnmin-#{MVNMIN_VERSION}/mvnmin-#{MVNMIN_VERSION}.zip"
  sha256 "4010c83cad1feeb36e437e7a869fb3603e31fcbc"
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
