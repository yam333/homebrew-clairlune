cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.17.5"
  sha256 arm:   "bbdecb9b0a698727c23bfb7e652ad12694dd64dcd9283ddef3dad95ec8c8f693",
         intel: "57dfedb27e69938dcf571dd678167a54107f3744b37c0bfac37f130f272dc236"

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
