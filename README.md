# Clairlune for Homebrew and Scoop

Install [Clairlune](https://yam333.github.io/Clairlune/), procedural animated ASCII-art desktop wallpapers, with a package manager. The source is at [yam333/Clairlune](https://github.com/yam333/Clairlune), and the [user guide](https://yam333.github.io/Clairlune/guide/) covers everything after installing.

## macOS (Homebrew)

```sh
brew install --cask yam333/clairlune/clairlune
```

The first time you open it, macOS blocks it, since it isn't notarized by Apple: click **Done** (not Move to Trash), then **Open Anyway** at the bottom of System Settings > Privacy & Security. The [Terminal installer](https://yam333.github.io/Clairlune/guide/#macos) has no such step.

## Windows (Scoop)

```powershell
scoop bucket add clairlune https://github.com/yam333/homebrew-clairlune
scoop install clairlune
```

Windows can also use winget (`winget install Clairlune.Clairlune`) once the package is accepted there, or the installer from the [releases page](https://github.com/yam333/Clairlune/releases).

## What's here

- `Casks/clairlune.rb`: the Homebrew cask.
- `bucket/clairlune.json`: the Scoop manifest.

Both are generated from each release's files by `scripts/package_manifests.py` in the main repository. Don't edit them here by hand.
