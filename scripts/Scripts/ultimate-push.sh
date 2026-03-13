#!/usr/bin/sh
# Simple shell script to push changes to remote repo
# Because I most oftenly push stuff to my repos at same period of time

cd ~/.dotfiles/
git push codeberg main

cd ~/Git/zshgod/
git push codeberg main

cd ~/.dotfiles/nvim/.config/nvim/
git push codeberg main
