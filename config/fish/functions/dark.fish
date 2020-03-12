# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.NL6w7b/dark.fish @ line 2
function dark
	tmux source-file ~/.tmux-themes/dark.conf
	# Turn on MacOS Dark mode
	osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"
end
