# Windword Labs Homebrew Tap

Homebrew casks for [Gyres](https://gyres.app/), a personal AI agent runtime with desktop, web and mobile clients.

The cask installs the signed and notarized macOS app from [windword-labs/gyres-releases](https://github.com/windword-labs/gyres-releases) and links `gyresd` (Gyres Core, which also works as a CLI) onto your `PATH`.

Apple silicon (arm64) only; macOS 12 or later.

## Install

```sh
brew install --cask windword-labs/tap/gyres
```

Installing by the fully qualified name trusts this one cask ([Homebrew tap trust](https://docs.brew.sh/Tap-Trust)); no `brew trust` step is needed.

## Upgrade

Gyres updates itself, so `brew upgrade` leaves it alone. To reinstall the latest release through Homebrew instead:

```sh
brew upgrade --cask --greedy windword-labs/tap/gyres
```

## Uninstall

```sh
brew uninstall --cask gyres
```

`--zap` also removes caches, preferences and `~/.gyres`, which holds your conversations and data. It cannot be undone:

```sh
brew uninstall --cask --zap gyres
```

## Maintainers: bumping the version

```sh
brew bump-cask-pr --version X.Y.Z windword-labs/tap/gyres
```

Or edit `Casks/gyres.rb` by hand: set `version`, and set `sha256` to the `Gyres-darwin-arm64.zip` line from the release's `SHA256SUMS`. Check with `brew style windword-labs/tap` and `brew audit --cask --online gyres`.
