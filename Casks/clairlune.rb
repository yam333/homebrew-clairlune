cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.17.0"
  sha256 arm:   "83d32c90b9fba051c5211c23802187f63d127562a35cb7661f60ae3dabc69aa7",
         intel: "a406a3238285b504e49ed07adcde002598670f596dd39b45bc945e26a776be64"

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
