#!/usr/bin/zsh
# Simple zsh script to push changes to remote repo
# Because I most oftenly push stuff to my repos at same period of time

print -P '%F{green}Dotfiles:%f'
cd ~/.dotfiles/
git status --short
print -P '%F{green}Pushing dotfiles...%f'
git push origin main

print ''
print -P '%F{green}Zshgod:%f'
cd ~/git/zshgod/
git status --short
print -P '%F{green}Pushing zshgod...%f'
git push origin main

print ''
print -P '%F{green}Zflex:%f'
cd ~/git/zflex/
git status --short
print -P '%F{green}Pushing zflex...%f'
git push origin main
