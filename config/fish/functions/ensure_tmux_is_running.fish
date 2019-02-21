# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.tOZ1lt/ensure_tmux_is_running.fish @ line 2
function ensure_tmux_is_running
	if not_in_tmux
        tmux_create_if_needed_and_attach
    end
end
