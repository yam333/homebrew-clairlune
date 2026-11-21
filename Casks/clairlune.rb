cask "clairlune" do
  arch arm: "aarch64", intel: "x64"

  version "0.15.0"
  sha256 arm:   "39b9c2aaffc931b8027a85e0189abe2db17360e736656eac1a725c906c27535b",
         intel: "93e56a9b842cc5f746756336634576028ad9207415edadd2da0624ae5117bc2d"

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
