function gpg-init
	if not begin
        # Is the agent running already? Does the agent-info file exist, and if so,
        # is there a process with the pid given in the file?
        [ -f ~/.gnupg/.gpg-agent-info ]
              and kill -0 (cut -d : -f 2 ~/.gnupg/.gpg-agent-info) ^/dev/null
        end
         # no, it is not running. Start it!
        killall gpg-agent
        gpg-agent --daemon --no-grab \
            --write-env-file ~/.gnupg/.gpg-agent-info \
            >/dev/null ^&1
    end
    # get the agent info from the info file, and export it so GPG can see it.
    set -gx GPG_AGENT_INFO (cut -c 16- ~/.gnupg/.gpg-agent-info)
    set -gx GPG_TTY (tty)
end
