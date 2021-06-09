#!/bin/sh

DFD=~/git/mydotfiles

echo copying ~/.config
cp -r ~/.config/ $DFD/
echo copying ~/.tmux.conf
cp ~/.tmux.conf $DFD/
echo copying ~/.zprofile
cp ~/.zprofile $DFD/
echo copying termux font
cp ~/.termux/font.ttf $DFD/

echo removing old backups
rm -rf $DFD/dot-zprofile
rm -rf $DFD/dot-tmux.conf
rm -rf $DFD/dot-config

echo renaming .config
mv ~/git/mydotfiles/.config/ $DFD/dot-config
echo renaming .tmux.conf
mv $DFD/.tmux.conf $DFD/dot-tmux.conf
echo renaming .zprofile
mv $DFD/.zprofile $DFD/dot-zprofile

echo Done
