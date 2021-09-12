#!/bin/zsh

export PATH="$PATH:${$(find ~/.scripts -type d -printf %p:)%%:}"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

unsetopt PROMPT_SP

export EDITOR="nvim"

export DOTFILES="$HOME/.dotfiles"
export FZF_DEFAULT_OPTS="--layout=reverse --height=40%"

export MANPAGER='nvim +Man!'
export MANWIDTH=99999


# ~/ Clean-up:
ZDOTDIR=$HOME/.config/zsh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# Other program settings:
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.config/plugins/tmux"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export SSB_HOME="$XDG_DATA_HOME/zoom"
