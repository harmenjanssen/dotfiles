function fish_prompt
    # Send notification for long-running tasks
    if test $CMD_DURATION
        if test $CMD_DURATION -gt 2000
            set secs (math "$CMD_DURATION / 1000")
            ~/.config/fish/osx_notification $history[1] $status $secs
        end
    end

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
