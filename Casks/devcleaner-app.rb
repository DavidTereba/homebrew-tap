cask "devcleaner-app" do
  version "1.17.1"
  sha256 "dd9f2cc1c12f0c3cbf80d4102c6f8cd84b72e0196eaff691fa10d7e9c28cd2cf"

  url "https://devcleaner.app/downloads/DevCleaner-#{version}.dmg"
  name "DevCleaner"
  desc "Find and clear developer tool caches"
  homepage "https://devcleaner.app/"

  livecheck do
    url "https://devcleaner.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  conflicts_with cask: "devcleaner"
  depends_on macos: :sonoma

  app "DevCleaner.app"

  uninstall launchctl: "app.DevCleaner.Helper",
            quit:      "app.DevCleaner"

  zap trash: [
    "~/Library/Application Support/DevCleaner",
    "~/Library/Caches/app.DevCleaner",
    "~/Library/Containers/app.DevCleaner.DevCleanerWidget",
    "~/Library/Group Containers/58JULA45XG.app.DevCleaner",
    "~/Library/HTTPStorages/app.DevCleaner",
    "~/Library/Logs/DevCleaner",
    "~/Library/Preferences/58JULA45XG.app.DevCleaner.plist",
    "~/Library/Preferences/app.DevCleaner.plist",
  ]
end
