################
##            ##
##   Prompt   ##
##            ##
################
autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red  
PROMPT='%F{red}${vcs_info_msg_0_}%f'

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
# zstyle ':vcs_info:*' unstagedstr ' *'
# zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
# then
#     precmd()
#     {
# 		print -Pn "\e]0;$(id --user --name)@$(echo $HOST):%~ - Alacritty\a"
# 
# 		# print ""
#     }
# 
#     preexec()
#     {
#         echo -en "\e]0;$(id --user --name)@$(echo $HOST): ${1}\a"
# 
#     }
# fi
# 
# 
# # Git Right Side Prompt:
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# 
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git:*' formats '%B%F{magenta} %b%f %F{red}%m%u%c%f'
# 
# 
# # Prompt Setup
# PROMPT="
# %B%F{cyan}%~%f "
# PROMPT+=\$vcs_info_msg_0_
# PROMPT+="
# %F{#bbff33}❯%f%b "

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


eval "$(starship init zsh)"
. "/home/hoshiya4522/.local/share/cargo/env"
