cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "463594f62620be0ba70a02f0b8a482f588c9a0b702b2e07f6e594e9a8a41c301",
         intel: "0327bd691cb800c35bf68edef8bea65e1dec30045814a753e5bcc94e18da1a0a"

  url "https://github.com/yam333/Clairlune/releases/download/v#{version}/Clairlune_#{version}_#{arch}.dmg"
  name "Clairlune"
  desc "Procedural, animated ASCII-art desktop wallpapers"
  homepage "https://github.com/yam333/Clairlune"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Clairlune.app"

  zap trash: "~/Library/Application Support/clairlune"

  caveats <<~EOS
    Clairlune runs in the menu bar (the moon icon).
  EOS
end
