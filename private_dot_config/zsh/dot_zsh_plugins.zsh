if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/.cache/antidote/github.com/romkatv/zsh-defer" )
  source "$HOME/.cache/antidote/github.com/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/.cache/antidote/github.com/zdharma-continuum/fast-syntax-highlighting" )
zsh-defer source "$HOME/.cache/antidote/github.com/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/zsh-users/zsh-autosuggestions" )
zsh-defer source "$HOME/.cache/antidote/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/zsh-users/zsh-history-substring-search" )
zsh-defer source "$HOME/.cache/antidote/github.com/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/zsh-users/zsh-completions" )
source "$HOME/.cache/antidote/github.com/zsh-users/zsh-completions/zsh-completions.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/Aloxaf/fzf-tab" )
source "$HOME/.cache/antidote/github.com/Aloxaf/fzf-tab/fzf-tab.plugin.zsh"
fpath+=( "$HOME/.cache/antidote/github.com/jeffreytse/zsh-vi-mode" )
source "$HOME/.cache/antidote/github.com/jeffreytse/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
