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

abbr cog 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # git for my config files

