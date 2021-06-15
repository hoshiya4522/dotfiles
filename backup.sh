#!/bin/sh

DFD=~/git/mydotfiles

echo copying ~/.config
cp -r ~/.config/ $DFD/
echo copying ~/.zprofile
cp ~/.zprofile $DFD/

echo removing old backups
rm -rf $DFD/dot-zprofile
rm -rf $DFD/dot-config

echo renaming .config
mv ~/git/mydotfiles/.config/ $DFD/dot-config
rm -rf dot-config/coc/extensions/coc-yank-data/yank
echo renaming .zprofile
mv $DFD/.zprofile $DFD/dot-zprofile

echo Done
