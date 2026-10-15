cask "gyres" do
  version "0.73.0"
  sha256 "d63b2fe5173160c6c69ef61eb49b0a76c6dc0b6d7db2e7663787ec1bd59ab13c"

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
