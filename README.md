# Dotfiles

Useful for setting up new machines.

Got a lot of opinionated stuff, or very specific work things, especially in Vim. So it's probably
best to cherry-pick the stuff you like.

Install:

```
git clone git://github.com/harmenjanssen/dotfiles ~/.dotfiles
cd ~/.dotfiles
node install.js
```

## VimPlug

My Neovim setup uses [VimPlug](https://github.com/junegunn/vim-plug). Install this first:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then run vim with just the plugins configuration (to avoid errors from yet-to-be-loaded plugins):

```
nvim -u ~/.config/nvim/plugins.vim
```

and run `:PlugInstall` from within vim.

Note that the [NCM2](https://github.com/ncm2/ncm2) plugin needs `pynvim`. Install using `pip`:

```
python3 -m pip install pynvim
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
