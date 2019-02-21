# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.InRsbQ/session_exists.fish @ line 2
function tmux_session_exists
	set -l session_name (basename (pwd))
    tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_name\$"
end
