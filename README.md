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


## Brewfile

I sorta manually try to remember to update the `Brewfile` from time to time.  
Install all Brew dependencies by running 

```
brew tap homebrew/bundle
brew bundle
```

in the dotfiles folder.


## Global Yarn packages

A handful of useful npm packages is installed globally using Yarn.
The `yarn.lock` file is in this repository and all packages within can be installed using 

```
yarn global upgrade
```

(This will also upgrade them to the latest version but I have yet to find a way to just install them)
