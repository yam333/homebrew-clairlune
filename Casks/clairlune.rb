cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.14.1"
  sha256 arm:   "4bea0c176ca7570644bd4e42288eacf9cf76de3dd6e5add72a3c75298f40ebc6",
         intel: "2ba21e82bac3803dc7d000dfe521cd7151749d787fee8808be38512a4e5e9600"

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
