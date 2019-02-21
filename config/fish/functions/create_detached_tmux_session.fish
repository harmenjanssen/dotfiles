# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.L0aBH7/create_detached_session.fish @ line 1
function create_detached_tmux_session
	set -l session_name (basename (pwd))
    begin
        set -lx TMUX ''
        tmux new-session -Ad -s "$session_name"
    end
end
