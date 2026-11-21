cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "406ed3fbcb67b30f020b33508d69b63a777e96d2e0ef0bb25ddfde06d3536ac8",
         intel: "baccba96d887c44498524f14843fac0071724da2b32258ce31e16ee9c16dae80"

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
