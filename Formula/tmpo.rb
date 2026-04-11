class Tmpo < Formula
  desc "Autonomous software delivery pipeline"
  homepage "https://github.com/jasonkatz/tmpo"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpo-darwin-arm64"
      sha256 "2e5e5e5901bd7ecfef3c6fe44c1eed90d11dfba03998fa593a10edeba27a5259"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpod-darwin-arm64"
        sha256 "f49df3db3399f5009215517e16faae8a11916b491a4a97ce11ab56d199408d6b"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpo-darwin-x64"
      sha256 "5a72e56dc146c241a184ba5872e2d510449556c04c6529747c2f208164436851"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpod-darwin-x64"
        sha256 "164dd6741c5061dc2138b70895310d877b574ee7b26743db3f9b3f7591305dc5"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpo-linux-arm64"
      sha256 "29e43a5f79ca72a0c4516951ac628afc5811386ce7637a6273cf55da8482e045"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpod-linux-arm64"
        sha256 "634bb0c41ba17c06634be6084fcf66317bb885bd63e12a7a1796a37d3af06e1b"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpo-linux-x64"
      sha256 "6320008f61403ebcb3cb87aba820742f6fe107e6bc4c234804c85549dbd488e6"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.1.0/tmpod-linux-x64"
        sha256 "44e62752ce86e420e86332af9ff4b95f6e288224d50fcee66f9ef1708ddfd3b1"
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
