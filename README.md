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

My Vim setup uses Vundle, so grab that separately:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

And run ```VundleInstall``` from Vim.

Remember to run

```
cd ~/.vim/bundle/ctrlp-cmatcher/;
./install.sh
```

to initiate the Ctrl-P cmatcher plugin. It makes Ctrl-P blazingly fast.
