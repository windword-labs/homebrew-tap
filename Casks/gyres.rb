cask "gyres" do
  version "0.133.4"
  sha256 "e3911758ae998a9016335f56d886476ba568fabdfb055b652172eed9046535ac"

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
