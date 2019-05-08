# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# disable XOFF
stty ixany 2> /dev/null
stty ixoff -ixon 2> /dev/null

# bash commands
alias ls='ls -h --color'  # add colors for filetype recognition
#alias ls='ls --file-type --group-directories-first --color -h'

# some git helpers
source ~/.git-completion.sh
alias gl='git lg'
alias glo="git log --oneline --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# git bash prompt
export GIT_PS1_SHOWDIRTYSTAT=1
export GIT_PS1_SHOWUPSTREAM=auto
. ~/.gitrc
export PS1="\[\033[01;31m\]$USER@\h \[\033[01;36m\]\t \[\033[1;37m\]\w\[\033[1;32m\]\$(__git_ps1 | sed 's/[()]//g')\[\033[1;37m\] $ "

