# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH


# for SSH connectivity reasons, if this is a remote box, set up a terminal to persist.
if [ ! -z "$SSH_CLIENT" ]; then
	CHECK_SCREEN_EXISTS=`which screen 2> /dev/null`
	CHECK_TMUX_EXISTS=`which tmux 2> /dev/null`
	if [ ! -z "$CHECK_SCREEN_EXISTS" ]; then
		/usr/bin/screen -dRR General
	# if not try tmux.
	elif [ ! -z "$CHECK_TMUX_EXISTS" ]; then
		# don't re-attach tmux if we already are in one!
		if [ "$TERM" != 'screen' ]; then
		    tmux attach || tmux new-session
		fi
	fi
fi
