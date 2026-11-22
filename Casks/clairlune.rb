cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.17.2"
  sha256 arm:   "cba45363849d17b92f0ea5559c5070feea41e339fb3ab6cb7f53691a0aaf51ab",
         intel: "c5025f3af8a3f406194c3b7840cad8fe23194103cb2814367c57aade210d98e8"

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
