#!/bin/sh

DFD=~/git/mydotfiles

echo copying ~/.config
cp -r ~/.config/ $DFD/
rm -rf $DFD/.config/coc
rm -rf $DFD/.config/configstore
echo copying ~/.tmux.conf
cp ~/.tmux.conf $DFD/
echo copying ~/.zshrc
cp ~/.zshrc $DFD/
echo copying termux font
cp ~/.termux/font.ttf $DFD/

echo removing old backups
rm -rf $DFD/dot-zshrc
rm -rf $DFD/dot-tmux.conf
rm -rf $DFD/dot-config

echo renaming .config
mv ~/git/mydotfiles/.config/ $DFD/dot-config
echo renaming .tmux.conf
mv $DFD/.tmux.conf $DFD/dot-tmux.conf
echo renaming .zshrc
mv $DFD/.zshrc $DFD/dot-zshrc

echo Done
