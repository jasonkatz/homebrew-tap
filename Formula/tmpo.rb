class Tmpo < Formula
  desc "Autonomous software delivery pipeline"
  homepage "https://github.com/jasonkatz/tmpo"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpo-darwin-arm64"
      sha256 "5b48bc04ae888c97a3dad61026a18bd95a19b2bb721e38c8e3784d4e7748ec57"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpod-darwin-arm64"
        sha256 "a6967ba8e41e5fa87b82c194ea01cd4ce73e64f4b19c7776174686798ec66bbf"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpo-darwin-x64"
      sha256 "a7014e343d864651526050e5a3dc7bf5e0b50851924aedaf49d3a4bc1690c0e9"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpod-darwin-x64"
        sha256 "34280362ece6b72022894ec2be69cbf23b14720b3c89a72c829b4cc514df0a4a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpo-linux-arm64"
      sha256 "abfcc389371ad4c57f8b01be63833e3ad126839c594c537a88f5397418b47fd2"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpod-linux-arm64"
        sha256 "91862c5dd54e6c5542e7b6d232bc0ea6dde5d39c89ab607c1a8ea7ce1a6988a9"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpo-linux-x64"
      sha256 "ffd104c1793f355e3d3bdaf79e7e3f5dd5475f65da2817b584e9f781d5e9e79c"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.0/tmpod-linux-x64"
        sha256 "5832e314df40907ad0ea6bcafacc8c08f811670adaf973836b515035ec32a26d"
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
