function fish_prompt
    # Print current time
	set_color blue
	printf (date "+%H:%M:%S ")

	set_color normal

	echo -n (prompt_pwd)
	set -l git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)

	if test $git_branch
		set -l git_dirty_count (git status --porcelain  | wc -l | sed "s/ //g")
		echo -n ":"
		if test $git_dirty_count -gt 0
			set_color red
		else
			set_color green
		end
		echo -n $git_branch
		if test $git_dirty_count -gt 0
			echo -n " "✘
		else
			echo -n " "✓
		end
	end

    # Finally, the place where actual commands are put in
	set_color normal
	printf "\n⚡️  "

end
