# Reset to system defaults
set -gx PATH /usr/bin /bin /usr/sbin /sbin

# Homebrew (ARM)
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Keg-only formulae
set -gx PATH /opt/homebrew/opt/mysql@8.0/bin $PATH
set -gx PATH /opt/homebrew/opt/curl/bin $PATH

# Herd
set -gx PATH $HOME/Library/Application\ Support/Herd/bin $PATH

# Python apps
set -gx PATH /Users/harmen/.local/bin $PATH

# Local project bins (dynamically added on directory change)
function __update_local_bins --on-variable PWD
    # Remove any previous local bin paths
    set -l new_path
    for p in $PATH
        if not string match -q "*/node_modules/.bin" $p
            and not string match -q "*/vendor/bin" $p
            set -a new_path $p
        end
    end
    set -gx PATH $new_path

    # Add local bins if they exist in the current directory
    if test -d ./vendor/bin
        set -gx PATH (pwd)/vendor/bin $PATH
    end
    if test -d ./node_modules/.bin
        set -gx PATH (pwd)/node_modules/.bin $PATH
    end
end
__update_local_bins

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

# Automatically switch to the right Node version if .nvmrc is present.
load_nvm > /dev/stderr

set -x HERD_PHP_74_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/74/"
set -x HERD_PHP_80_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/80/"
set -x HERD_PHP_81_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/81/"
set -x HERD_PHP_82_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/82/"
set -x HERD_PHP_83_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/83/"
set -x HERD_PHP_84_INI_SCAN_DIR "/Users/harmen/Library/Application Support/Herd/config/php/84/"

# pnpm
set -gx PNPM_HOME "/Users/harmen/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

