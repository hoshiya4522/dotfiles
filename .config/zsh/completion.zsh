####################
##                ##
##   Completion   ##
##                ##
####################
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# case insesetive match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

