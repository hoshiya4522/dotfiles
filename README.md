# dotfiles
hoshiya's shitty dotfiles.

### Installation
```bash
echo ".dotfiles" >> .gitignore

git clone --bare https://github.com/hoshiya4522/dotfiles/tree/master $HOME/.dotfiles

alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dots checkout

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

dots checkout

mkdir -p ~/.config/plugins/zsh
mkdir -p ~/.config/plugins/tmux

sudo sh -c "curl https://raw.githubusercontent.com/holman/spark/master/spark -o /usr/local/bin/spark && chmod +x /usr/local/bin/spark"

git clone https://github.com/tmux-plugins/tpm ~/.config/plugins/tmux

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/plugins/zsh/zsh-autosuggestions
git clone https://github.com/joshskidmore/zsh-fzf-history-search ~/.config/plugins/zsh/zsh-fzf-history-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/plugins/zsh/zsh-syntax-highlighting
```
