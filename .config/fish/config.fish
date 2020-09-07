set fish_greeting # no greeting

# Aliases. Work when just typing <RET> after them.
alias l   'exa -F'
alias la  'exa -a'
alias ll  'exa -l --header --git'
alias llt 'exa -l --header --git --tree' 

# Abbreviations. Good for commands that will always be followed by a space.
abbr g 'git'
abbr v 'vi'
abbr b 'bat'
abbr pg 'ps xa|rg'

abbr cog 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # git for my config files

alias em 'emacsclient -n -c -a ""'

set FZF_TMUX_HEIGHT 100%
set FZF_DEFAULT_COMMAND "fd . $HOME"
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set FZF_ALT_C_COMMAND "fd -t d . $HOME"
set FZF_DEFAULT_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always {}'"
