cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "9c41f40f78efc29267d82bc877cd6f7f9dabc6b8df583ae12bba50c6bf7175ed",
         intel: "ddf1adeb10554fa776ba76fce15127dafef5c9b9c331ba4d2a642887031f5365"

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
