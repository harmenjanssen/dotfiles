tmux source-file ~/.tmux-themes/$TMUX_THEME_NAME/dark.conf
# Turn on MacOS Dark mode
osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" > /dev/null
