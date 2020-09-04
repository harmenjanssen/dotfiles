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

## Vundle 

My Vim setup uses Vundle, so grab that separately:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

And run `:VundleInstall` from Vim.

The plugin PHPActor needs a separate `composer install` command, run from directory `~/vim/bundle/phpactor/`.


*Note* some things in my vim setup have been reported problematic on vim 7.4.  
Try to upgrade to the latest version, I'm maintaining vim via Homebrew and that seems to work fine.

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
