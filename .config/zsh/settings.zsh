##################
# Minor Settings #
##################
bindkey -v
export KEYTIMEOUT=10
export EDITOR="nvim"
# Load aliases and shortcuts if exists.
source ~/.config/shell/aliasrc

# ctrl+backspace stops at /
autoload -U select-word-style
select-word-style bash
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'


#################
##             ##
##   History   ##
##             ##
#################
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=9999999
HISTFILE=~/.cache/zsh/history
setopt appendhistory
setopt SHARE_HISTORY
setopt histignorealldups




