tmux source-file ~/.tmux-themes/$TMUX_THEME_NAME/light.conf
# Turn off MacOS Dark mode
osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false;" > /dev/null
