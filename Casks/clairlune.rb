cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "034830a1c6cd17f00a6533c3ff0c5e4cec372ba74ac7789909b2e028461b1c51",
         intel: "867d5c90c5b41ffed3620805bfe858d49590fbc7ef89e46d149a2688d73f0bfe"

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
