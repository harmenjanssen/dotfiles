# Defined in /var/folders/73/37k7411j1m7g93vqvkbp7swc0000gq/T//fish.ibt7m6/agc.fish @ line 2
function agc
	ag $argv --no-filename --no-break | wc -l
end
