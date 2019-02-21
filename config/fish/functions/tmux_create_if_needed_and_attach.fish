# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.YFAhc8/tmux_create_if_needed_and_attach.fish @ line 2
function tmux_create_if_needed_and_attach
	set -l session_name (basename (pwd))
    if not_in_tmux
        tmux new-session -As "$session_name"
    else
        tmux_session_exists
        if test $status -gt 0
            create_detached_tmux_session
        end
        tmux switch-client -t "$session_name"
    end
end
