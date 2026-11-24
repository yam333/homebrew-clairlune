cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.30.0"
  sha256 arm:   "ee88f6e976f2621a7528f46c34941e34b29e997810661efbc82c6398389630b9",
         intel: "f57a494f81df3742ede1fb4751dfdca81e7e4842d9f456a4838752548e5245a3"

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
