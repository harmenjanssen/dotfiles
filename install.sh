#!/usr/bin/env bash
#
# Symlink each top-level entry in this repo to ~/.<name>.
# For example: gitconfig is intentionally absent because it lives at
# config/git/config (XDG); top-level dirs like vim and config get linked
# to ~/.vim and ~/.config.
#
# Prompts before overwriting existing files. Answer with y / N / a (all) / q.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

EXCLUDE=(
    .DS_Store
    .git
    .gitignore
    Brewfile
    README.md
    install.sh
    osx_config.sh
)

is_excluded() {
    local name="$1"
    for e in "${EXCLUDE[@]}"; do
        [[ "$name" == "$e" ]] && return 0
    done
    return 1
}

overwrite_all=false

shopt -s dotglob nullglob
for path in "$SCRIPT_DIR"/*; do
    name=$(basename "$path")
    is_excluded "$name" && continue

    target="$HOME/.$name"

    if [[ -e "$target" || -L "$target" ]]; then
        if ! $overwrite_all; then
            read -r -p "$target already exists. Overwrite? [yNaq] " answer
            case "$answer" in
                y) ;;
                a) overwrite_all=true ;;
                q) echo "Aborted."; exit 0 ;;
                *) echo "Skipping .$name"; continue ;;
            esac
        fi
        rm -rf "$target"
    fi

    echo "linking .$name"
    ln -s "$path" "$target"
done

echo
echo "Done."
echo "Run osx_config.sh to configure macOS."
