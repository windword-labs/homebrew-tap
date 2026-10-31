cask "gyres" do
  version "0.108.1"
  sha256 "c8f1c3194250296b1999640a51f7c4e424546f04e99f2489d7dcaa5813048322"

  url "https://github.com/windword-labs/gyres-releases/releases/download/v#{version}/Gyres-darwin-arm64.zip"
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
