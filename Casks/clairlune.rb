cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.16.0"
  sha256 arm:   "3f462737538a2b3a65b53ed8fc65962c15487152f8b9babdf3fdaca8a29c99ef",
         intel: "20234ee6f8252fd03fb480bb58b124efc9ac4d07cd48c967ae809d4ae7ff036d"

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
