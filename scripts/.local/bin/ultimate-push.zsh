#!/usr/bin/zsh
# Simple zsh script to push changes to remote repo
# Because I most oftenly push stuff to my repos at same period of time

print -P '%F{green}dotfiles:%f'
cd ~/.dotfiles/
git status --short
print -P '%F{green}Pushing dotfiles...%f'
git push codeberg main

print ''
print -P '%F{green}ZshGod:%f'
cd ~/Git/ZshGod/
git status --short
print -P '%F{green}Pushing ZshGod...%f'
git push codeberg main

print ''
print -P '%F{green}Colornstant:%f'
cd ~/Git/colornstant/
git status --short
print -P '%F{green}Pushing Colornstant...%f'
git push codeberg main

print ''
print -P '%F{green}NV-GOD:%f'
cd ~/.dotfiles/nvim/.config/nvim/
git status --short
print -P '%F{green}Pushing NV-GOD...%f'
git push codeberg main
