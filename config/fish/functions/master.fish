# Defined in /var/folders/7r/7g32h7k14874x9cwg4mkv8w40000gn/T//fish.7Y5CRk/master.fish @ line 2
function master
	git checkout (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
end
