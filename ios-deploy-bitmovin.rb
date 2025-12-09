class IosDeployBitmovin < Formula
  desc "Install and debug iPhone apps from the command-line (Bitmovin fork)"
  homepage "https://github.com/bitmovin-engineering/ios-deploy"
  license all_of: ["GPL-3.0-or-later", "BSD-3-Clause"]
  head "https://github.com/bitmovin-engineering/ios-deploy.git", branch: "feature/add-brew-formula-file"

  depends_on xcode: :build
  depends_on :macos

  def install
    xcodebuild "-configuration", "Release",
               "SYMROOT=build",
               "-arch", Hardware::CPU.arch

    bin.install "build/Release/ios-deploy"
  end

  test do
    system bin/"ios-deploy", "-V"
  end
end
