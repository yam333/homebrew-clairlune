cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.37.0"
  sha256 arm:   "fab348d278b87ee8ac0088aa1dfd88442b9c2c7d50f8a9a307aae29ee81c42a6",
         intel: "a25f55b67a472f14a6c1edd7c3be9d6c98d3b0f54ea685c0f6174039959a0072"

  url "https://github.com/yam333/Clairlune/releases/download/v#{version}/Clairlune_#{version}_#{arch}.dmg",
      verified: "github.com/yam333/Clairlune/"
  name "Clairlune"
  desc "Procedural, animated ASCII-art desktop wallpapers"
  homepage "https://yam333.github.io/Clairlune/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Clairlune updates itself (Settings > General > Update now).
  auto_updates true
  depends_on macos: :ventura

  app "Clairlune.app"

  # No `uninstall launchctl:` for the start-at-login agent: Homebrew runs
  # uninstall on every upgrade too, where it stopped the running app,
  # deleted the agent (start at login off) and asked for an admin password
  # to look for a system-wide one. Settings > General > Remove Clairlune
  # takes the agent away; so does zap. (The screen saver lines are for
  # versions before 0.18, which had one.)
  zap trash: [
    "~/Library/Application Support/clairlune",
    "~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Logs/Clairlune Saver.log",
    "~/Library/LaunchAgents/app.clairlune.plist",
    "~/Library/Screen Savers/Clairlune.saver",
  ]

  caveats <<~EOS
    Clairlune runs in the menu bar (the square over a circle).

    The first time you open it, macOS blocks it. Click Done (not Move to
    Trash), then Open Anyway at the bottom of Privacy & Security:
      open "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Security"
  EOS
end
