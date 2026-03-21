#!/usr/bin/zsh
# Simple zsh script to push changes to remote repo
# Because I most oftenly push stuff to my repos at same period of time

print -P '%F{green}Pushing dotfiles...%f'
cd ~/.dotfiles/
git push codeberg main

print -P '%F{green}Pushing ZshGod...%f'
cd ~/Git/zshgod/
git push codeberg main

print -P '%F{green}Pushing NV-GOD...%f'
cd ~/.dotfiles/nvim/.config/nvim/
git push codeberg main
