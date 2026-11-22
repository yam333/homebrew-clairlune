cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.18.0"
  sha256 arm:   "0ae76603ccebb6a71c7624cbb353cb040f7ca3ea97b9708e0bbfe2f5e7b74572",
         intel: "040a39883c30dd203c3809bfaab6da8b752ebe00c5829d689ff0b5f1b22eca3d"

  url "https://github.com/yam333/Clairlune/releases/download/v#{version}/Clairlune_#{version}_#{arch}.dmg"
  name "Clairlune"
  desc "Procedural, animated ASCII-art desktop wallpapers"
  homepage "https://github.com/yam333/Clairlune"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Clairlune updates itself (Settings > General > Update now).
  auto_updates true
  depends_on macos: :ventura

  app "Clairlune.app"

  # The start-at-login agent the app adds.
  uninstall launchctl: "app.clairlune"

  zap trash: [
    "~/Library/Application Support/clairlune",
    "~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Logs/Clairlune Saver.log",
    "~/Library/Screen Savers/Clairlune.saver",
  ]

  caveats <<~EOS
    Clairlune runs in the menu bar (the moon icon).
  EOS
end
