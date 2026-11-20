# Clairlune for Homebrew and Scoop

Install [Clairlune](https://github.com/yam333/Clairlune), procedural animated ASCII-art desktop wallpapers, with a package manager.

## macOS (Homebrew)

```sh
brew install --cask yam333/clairlune/clairlune
```

Clairlune isn't notarized by Apple yet. If macOS won't open it the first time, open System Settings > Privacy & Security and click Open Anyway.

## Windows (Scoop)

```powershell
scoop bucket add clairlune https://github.com/yam333/homebrew-clairlune
scoop install clairlune
```

Windows can also use winget (`winget install Clairlune.Clairlune`) once the package is accepted there, or the installer from the [releases page](https://github.com/yam333/Clairlune/releases).

## What's here

- `Casks/clairlune.rb`: the Homebrew cask.
- `bucket/clairlune.json`: the Scoop manifest.
- `aur/clairlune-bin/`: the Arch User Repository package (`PKGBUILD`, `.SRCINFO`), for the AUR maintainer to push.

All are generated from each release's files by `scripts/package_manifests.py` in the main repository. Don't edit them here by hand.
