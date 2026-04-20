class Tmpo < Formula
  desc "Autonomous software delivery pipeline"
  homepage "https://github.com/jasonkatz/tmpo"
  version "0.2.3"
  license "MIT"

  on_macos do
    odie "tmpo only ships macOS binaries for Apple Silicon (arm64)" unless Hardware::CPU.arm?

    url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.3/tmpo-darwin-arm64"
    sha256 "ce379236435124262498f74f7f5818c3bcf9d1c5a3d8d5f327327e506fcfdd52"

    resource "tmpod" do
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.3/tmpod-darwin-arm64"
      sha256 "a7ff39f32947493794858fa7741bf404c4f9aab18b268b34e15c8e9f499d9a4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.3/tmpo-linux-arm64"
      sha256 "a766954b3a889449338c9128083ec37011a0f574f19387cdc810bc9f699de0eb"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.3/tmpod-linux-arm64"
        sha256 "6a70af81c640a3f1ab64442b6727f8df5442f4904716aa7a8c840fe5bee3b4c5"
      end
    else
      url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.3/tmpo-linux-x64"
      sha256 "5dbe3d8d4c9194cbfa3586bdcc75332aefba5891a0a86514b91831a4c009d46b"

      resource "tmpod" do
        url "https://github.com/jasonkatz/tmpo/releases/download/v0.2.3/tmpod-linux-x64"
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
