# Set up history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Utility to check if a function exists
function_exists() {
  local -a files
  # This expands occurrences of $1 anywhere in $fpath,
  # removing files that don't exist.
  files=(${^fpath}/$1(N))
  # Success if any files exist.
  (( ${#files} ))
}

# Automatically cd to directories when they are typed as a command
setopt autocd

# Turn off terminal beeps
unsetopt beep

# Default location for this file
zstyle :compinstall filename '~/.zshrc'

# Turn on autocomplete
autoload -Uz compinit
compinit

# Use extended globbing
setopt extendedglob

# Use emacs-style command editing (use -v for vi style, but it's a bit confusing)
bindkey -e

# Allow short loops, e.g. for file **/*.scala; echo ${file}
setopt shortloops

# Enable colors
autoload -U colors
colors

# Set ls colors
LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# Add ls colors to completions
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Speed up completion (see http://lethalman.blogspot.com/2009/10/speeding-up-zsh-completion.html)
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Aliases
alias rc='source ~/.zshrc'
alias ls='ls --color'
alias less='less -R'
alias ssh='ssh -XY'

# Don't hang up on processes when exiting the terminal
setopt nohup

# Prompt
PROMPT="%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m%{$reset_color%} %{$fg_bold[yellow]%}%36<..<%~%{$reset_color%} %# "

# Show VCS info in the right-side prompt (see http://physos.com/2010/09/24/my-custom-zsh-prompt/)
autoload -Uz vcs_info
if function_exists vcs_info; then
  setopt prompt_subst
  zstyle ':vcs_info:*' unstagedstr "%{$fg_bold[yellow]%}*%{$reset_color%} "
  zstyle ':vcs_info:*' actionformats "[%u%F{green}%b%a%f]"
  zstyle ':vcs_info:*' formats "[%u%F{green}%b%f]"
  zstyle ':vcs_info:*' branchformat "%b"
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' check-for-changes true
  precmd() { vcs_info }
  RPROMPT='${vcs_info_msg_0_}'
fi

# Make sure git completions are fast by only looking at local data
__git_files () {
  _wanted files expl 'local files' _files
}
