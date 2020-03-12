# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.enQhbT/light.fish @ line 2
function light
	tmux source-file ~/.tmux-themes/light.conf
	# Turn off MacOS Dark mode
	osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false"
end
