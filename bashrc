# Don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it
shopt -s histappend

# History size
HISTSIZE=5000
HISTFILESIZE=10000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Editor settings
export EDITOR=vim
export VISUAL=gvim
export PAGER=less
export SVN_EDITOR='gvim -f'
export GIT_EDITOR='gvim -f'
export P4EDITOR='gvim -f'

# Colors (careful, some of these cause lag over a network)
export LS_COLORS=$LS_COLORS:"di=00;94"
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Aliases
alias rc='source ~/.bashrc'
alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias ll='ls -l'
alias la='ls -a'
alias ..='cd ..'
alias less='less -R'
alias ssh='ssh -XY'

# Prompt
export PS1='\[\033[1;32m\]\u\[\033[0m\]@\[\033[1;31m\]\h\[\033[0m\] \[\033[1;33m\]\w\[\033[0m\]$ '

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi
