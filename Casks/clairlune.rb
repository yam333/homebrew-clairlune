cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.17.6"
  sha256 arm:   "5cd46cc3e510f26f9439b9ca180647e2de3d7241795aeebdb573a4fa1ef9d348",
         intel: "8dca56e67f3eb9aca16712c2cf27a4291784fc000cd02793eb446fd7c5a087da"

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
