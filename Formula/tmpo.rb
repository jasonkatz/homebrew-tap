class Tmpo < Formula
  desc "Autonomous software delivery pipeline"
  homepage "https://github.com/jasonkatz/tmpo"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpo-darwin-arm64"
      sha256 "ad0f19943242ff2b89e77b7411b17d808ae3b606dd67395fcec48b6ca151cb27"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpod-darwin-arm64"
        sha256 "4252ba176d7a69236d07c6fa40374cc90851babc1d750f7eef571c9da217d1eb"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpo-darwin-x64"
      sha256 "d21b7752495180ee6dc4bbd23485fc80a83ff79076ce747ebd7ea0ee70fae078"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpod-darwin-x64"
        sha256 "1d0ea26adaae9044fda58349253198bdf0e89e41800877478731992e960d8340"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpo-linux-arm64"
      sha256 "7fd495b2669f96bbae21467ef6a2f6d98682949b1bac960ced81969accc6932b"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpod-linux-arm64"
        sha256 "6a70af81c640a3f1ab64442b6727f8df5442f4904716aa7a8c840fe5bee3b4c5"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpo-linux-x64"
      sha256 "eea63447280d9d7778c09bdcfb408c8b0f570ea7db5a640a2e5ad950e5106b6d"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.1/tmpod-linux-x64"
        sha256 "ccacc41702635bc890e007f3668741d65fef2a4253ce1dfe6e4d2a4227bc3809"
      end
    end
  end

  def install
    bin.install stable.url.split("/").last => "tmpo"
    resource("tmpod").stage do
      bin.install Dir["tmpod-*"].first => "tmpod"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmpo --version")
  end
end
