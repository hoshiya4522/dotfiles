##################
##              ##
##   Bindings   ##
##              ##
##################
#Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ranger does cd when exit (commented because I don't use ranger anymore)
# function rcd {
#     local IFS=$'\t\n'
#     local tempfile="$(mktemp -t tmp.XXXXXX)"
#     local ranger_cmd=(
#         command
#         ranger
#         --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
#     )
#     ${ranger_cmd[@]} "$@"
#     if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
#         cd -- "$(cat "$tempfile")" || return
#     fi
#     command rm -f -- "$tempfile" 2>/dev/null
# }

# Opens Ranger with rcd
# bindkey -s '^o' 'rcd\n'

# bookmark script shortcut
bindkey -s '^b' 'bmgo\n'

# Opens bc
#bindkey -s '^a' 'bc -lq\n'

# Opens fzf with cd capability
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey -s '^g' 'lazygit\n'
bindkey -s '^w' 'curl wttr.in/Rangpur%20Rangpur%20Bangladesh\n'
bindkey -s '^s' 'lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# ctrl modements
bindkey '^[[1;5D' backward-word 
bindkey '^[[1;5C' forward-word


# jk is ESCape to vim normal mode
bindkey -M viins 'jk' vi-cmd-mode

# Ctrl + Backspace and Ctrl + Delete 
bindkey -M viins '^[[3^' backward-kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey '^H' backward-kill-word
#bindkey '^H' backward-kill-dir

