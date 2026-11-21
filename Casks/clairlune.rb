cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.13.1"
  sha256 arm:   "f499caf7eacf6b9be51def4c9f0b1fb463acd3fbb8a68be4fc6e392dc7d332f5",
         intel: "07fff5e99b54b896f8185104dfcf0fa3814bff2a3cbfd2e68d94219fd1dca516"

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
