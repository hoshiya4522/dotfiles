#!/bin/sh

DIR=~/coding/git/mydotfiles

rm -rf $DIR/*/.config/*
rm -rf $DIR/zprofile/.zprofile

cp -r ~/.config/jupyter/ $DIR/jupyter/.config/jupyter
cp -r ~/.config/lf/ $DIR/lf/.config/lf
cp -r ~/.config/zsh/ $DIR/zsh/.config/zsh
cp -r ~/.config/tmux/ $DIR/tmux/.config/tmux
cp -r ~/.config/nvim/ $DIR/nvim/.config/nvim
cp -r ~/.config/shell/ $DIR/shell/.config/shell
cp -r ~/.config/ranger/ $DIR/ranger/.config/ranger
cp ~/.zprofile $DIR/zprofile/
cp ~/.config/starship.toml $DIR/starship/.config/

rm -rf $DIR/tmux/.config/tmux/plugins/
rm -rf $DIR/zsh/.config/zsh/plugins/
rm -rf $DIR/nvim/.config/nvim/plugins/
echo Done
