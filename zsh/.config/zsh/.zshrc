export PATH="/usr/local/mysql/bin:$PATH"


autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# case insesetive match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'



    
# Load aliases and shortcuts if existent.
source ~/.config/shell/aliasrc
# nerd icons config for lf
source ~/.config/zsh/lficons.zsh
# keybindings for zsh
source ~/.config/zsh/keybinds.zsh
source ~/.config/zsh/cursor.zsh


################
#              #
#   Plugins    #
#              #
################

# syntax highlightung for zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# syntax autosuggestions for zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#696969"
# Starship
eval "$(starship init zsh)"
