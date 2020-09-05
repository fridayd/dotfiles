# Colors
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Aliases
alias l="ls -G"
alias ls="l"
alias ll="l -lhF"

# Git for my dotfiles
alias cog="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Prompt
#PROMPT="%n %~ %# "
#PROMPT="%~ %# "
#PROMPT=$'\e[0;36m%~ \e[0;33m>\e[0m '
#PROMPT=$'%{\e[0;36m%2~ \e[0;31m>\e[0;33m>\e[0;32m> \e[0m%} '
autoload -U colors && colors
#PROMPT="%t %{$fg[cyan]%}%?%{$resetcolor%} %{$fg[blue]%}%~%{$resetcolor%} %# "
#PROMPT="%{$fg[cyan]%}%~%{$resetcolor%} "
#PROMPT=$'%{(%h) \e[0;36m%2~ \e[0;31m>\e[0;33m>\e[0;32m> \e[0m%} '

# History
HISTSIZE=10000
SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY

# set the terminal window title
precmd () { print -Pn "\e]2; %3~\a" }

# binds up and down arrows to searching history
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# I've installed some sbin stuff via homebrew
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Homebrew zsh-completions
#fpath=(/usr/local/share/zsh-completions $fpath);

# fortune, of course!
echo ""
fortune
echo ""

# Emacs client and server
#function emacs()
#{
#  # -c creates a new frame
#  # -a= fires a new emacs server if none is running
#  emacsclient -c -a= $*
#}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
