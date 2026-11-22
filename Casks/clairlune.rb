cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.17.1"
  sha256 arm:   "99b3f6d376c23d459fd1fad88bf4bf550ae54315f308fdfaa558db676af820e8",
         intel: "897fe4ecba0396df0fce96cb967c9a18abc779d601e8787f29507de1450953aa"

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
