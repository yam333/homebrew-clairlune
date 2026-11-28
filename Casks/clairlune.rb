cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.36.1"
  sha256 arm:   "29cccb8e39c5913ca895caf220e971d9b834de0e2b435ae8eb02bd37f8e71cfa",
         intel: "377845883493881e2d0ad308c3ef5661a93e8b07e7c9d049f8d90c0805e636f8"

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
