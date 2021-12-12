# dotfiles
hoshiya's shitty dotfiles.

### Installation
```
echo ".dotfiles" >> .gitignore

git clone --bare <git-repo-url> $HOME/.dotfiles

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

config checkout

mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout
```
