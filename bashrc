export EDITOR=vim
export VISUAL=gvim
export PAGER=less
export SVN_EDITOR='gvim -f'
export GIT_EDITOR='gvim -f'

export LS_COLORS=$LS_COLORS:"di=00;94"

alias rc='source ~/.bashrc'
alias rm='rm -i'
alias mv='mv -i'
alias ln='ln -i'
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias ..='cd ..'
alias less='less -R'
alias ssh='ssh -XY'
alias mm='mvn install'
alias mmcd='mvn clean install'

export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$ '

# Silly hack to make paths shorter
if [[ `pwd` == "/main/home/"`whoami` ]] 
  then cd ~ 
fi