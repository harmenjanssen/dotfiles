set PATH $HOME/Library/Application\ Support/Herd/bin/ \
    ~/.composer/vendor/bin \
    ./node_modules/.bin \
    ./vendor/bin \
    /usr/local/bin \
    $PATH

set fish_greeting

set -x CFLAGS -Qunused-arguments
set -x CPPFLAGS -Qunused-arguments

set -x -g CLICOLOR 1
set -x -g LSCOLORS GxFxCxDxBxhgedabagacad
set -x -g TERM xterm-256color

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x -g EDITOR nvim

ssh-add ~/.ssh/id_dsa > /dev/null 2>&1
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

set -x -g XDEBUG_CONFIG "idekey=xdebug"

#ensure_tmux_is_running

# Automatically switch to the right Node version if .nvmrc is present.
# Shit, this messes up FZF in vim... How?!
#load_nvm > /dev/stderr

set -x HERD_PHP_74_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/74/"
set -x HERD_PHP_80_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/80/"
set -x HERD_PHP_81_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/81/"
set -x HERD_PHP_82_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/82/"
set -x HERD_PHP_83_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/83/"

# pnpm
set -gx PNPM_HOME "/Users/harmen/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
