
require "formula"

class Mvnmin < Formula
  MVNMIN_VERSION = "1.0.2"
  desc "mvnmin - minimal maven builds"
  homepage "https://github.com/elasticpath/mvnmin"
  url "https://github.com/elasticpath/mvnmin/releases/download/mvnmin-#{MVNMIN_VERSION}/mvnmin-#{MVNMIN_VERSION}.zip"
  sha256 "246b24e1484b926313185935e6feb02e68fc52f639318dc51513c91fba72085c"
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
