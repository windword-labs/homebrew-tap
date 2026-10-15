cask "gyres" do
  version "0.71.0"
  sha256 "7c642a19e61483a8bc07d003bc4c95d9d3d986792f89d822e64dddcd4b4af58f"

  url "https://github.com/windword-labs/gyres-releases/releases/download/v#{version}/Gyres-darwin-arm64.zip",
      verified: "github.com/windword-labs/gyres-releases/"
  name "Gyres"
  desc "Personal AI agent runtime with desktop, web and mobile clients"
  homepage "https://gyres.app/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Gyres.app"
  binary "#{appdir}/Gyres.app/Contents/MacOS/gyresd"

  # ~/.gyres holds the user's conversations and data
  zap trash: [
    "~/.gyres",
    "~/Library/Application Support/com.windword.gyres.desktop",
    "~/Library/Caches/com.windword.gyres.desktop",
    "~/Library/HTTPStorages/com.windword.gyres.desktop",
    "~/Library/Logs/com.windword.gyres.desktop",
    "~/Library/Preferences/com.windword.gyres.desktop.plist",
    "~/Library/Saved Application State/com.windword.gyres.desktop.savedState",
    "~/Library/WebKit/com.windword.gyres.desktop",
  ]
end
