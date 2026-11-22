cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.17.3"
  sha256 arm:   "054802af8c8772a02a906137fb381cd785d0a65b6580cf03be68fcbcc1b55f3f",
         intel: "1aed9041203d04535e967e9202f6526f55661751a354a67a936d9a9b1da20722"

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
