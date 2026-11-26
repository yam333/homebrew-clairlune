cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.33.0"
  sha256 arm:   "cde1b06beb83e1287a74a55d68df566cfb656ac46cf13a76507b08e2f96a9f60",
         intel: "dc6006fe97900c23d41652ec4c60454123fe79bc1688018e96798ad05947b178"

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
