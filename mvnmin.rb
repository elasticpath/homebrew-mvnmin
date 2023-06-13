
require "formula"

class Mvnmin < Formula
  MVNMIN_VERSION = "1.0.3"
  desc "mvnmin - minimal maven builds"
  homepage "https://github.com/elasticpath/mvnmin"
  url "https://github.com/elasticpath/mvnmin/releases/download/mvnmin-#{MVNMIN_VERSION}/mvnmin-#{MVNMIN_VERSION}.zip"
  sha256 "2669c3d36f468d9069bde1d0c1c94b7c05ac072a60c6ad4fe60d9048792e8e7b"
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
