# dotfiles
hoshiya's shitty dotfiles.

### Installation
```
echo ".dotfiles" >> .gitignore

git clone --bare https://github.com/hoshiya4522/dotfiles/tree/master $HOME/.dotfiles

alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dots checkout

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

dots checkout
```
