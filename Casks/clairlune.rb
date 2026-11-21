cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.12.0"
  sha256 arm:   "ccf6d82c364169e657b75de7faade54924675e11899ffd4f36a1eacce340ae58",
         intel: "b8140893842ab686e4ccdd06d6c42ff8be523ac26e85d4cbb2a40ea0a44b957d"

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
