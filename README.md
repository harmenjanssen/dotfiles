# Dotfiles

Useful for setting up new machines.

Got a lot of opinionated stuff, or very specific work things, especially in Vim. So it's probably
best to cherry-pick the stuff you like.

Install:

```
git clone https://github.com/harmenjanssen/dotfiles ~/dotfiles
cd ~/dotfiles
node install.js
```

## vim-plug

The Neovim setup uses [vim-plug](https://github.com/junegunn/vim-plug). Bootstrap it
and install plugins in one go:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
```


## Fish

The fish setup uses [Fisher](https://github.com/jorgebucaran/fisher) for plugins.
Plugin files are not tracked in this repo — only the manifest `config/fish/fish_plugins`.
On a new machine, bootstrap Fisher and install everything in one go:

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher update
```

`fisher update` reads `fish_plugins` and installs each listed plugin into
`~/.config/fish/`.


## macOS settings

`osx_config.sh` tweaks a bunch of macOS defaults (trackpad tap-to-click, fast
key repeat, no smart dashes, sensible Finder defaults, etc.). It's tested on
macOS Sequoia (15.x). Run it once on a new machine:

```
bash osx_config.sh
```

Some changes only take effect after a logout or restart.


## Brewfile

I sorta manually try to remember to update the `Brewfile` from time to time.  
Install all Brew dependencies by running 

```
brew tap homebrew/bundle
brew bundle
```

in the dotfiles folder.


## Node and pnpm

Node is managed via [nvm](https://github.com/nvm-sh/nvm); the fish setup auto-switches versions
based on `.nvmrc`. pnpm is the package manager of choice and is enabled through Corepack:

```
corepack enable pnpm
```

`PNPM_HOME` is set in `config/fish/config.fish`, so any globally installed packages
(`pnpm add -g <pkg>`) end up on `PATH` automatically. No global manifest is tracked
in this repo — install ad-hoc as needed.
