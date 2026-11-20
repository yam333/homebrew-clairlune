cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.10.0"
  sha256 arm:   "b33558794338fd9343cbb7ca708759eeb8c8d6c7422a5273e67b131923f4e30c",
         intel: "c513011b20ba47d40f3fad8e4df9529b071f5c69acf453110698889583f640e6"

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
