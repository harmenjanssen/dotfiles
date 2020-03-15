# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.oeTF2V/light.fish @ line 2
function light
	sh ~/.config/light.sh
	#tmux source-file ~/.tmux-themes/light.conf
	## Turn off MacOS Dark mode
	#osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false"
end
