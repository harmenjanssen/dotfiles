# Finish a Git Flow branch with the Golem wrapper
function finish
	switch (git-curr-branch-type)
	case "feature"
		g feature finish
	case "hotfix"
		g hotfix finish
	case "release"
		g release finish
	case "*"
		echo "You can't finish this type of branch."
	end
end
