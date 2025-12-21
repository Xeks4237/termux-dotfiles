# [ Environment Variables ]
source ~/.config/zsh/environment.zsh

# [ Zinit plugin manager ]
source $XDG_CONFIG_HOME/zsh/zinit.zsh

# [ Etc little pieces of code ]
source $XDG_CONFIG_HOME/zsh/etc.zsh

# [ Keymaps ]
source $XDG_CONFIG_HOME/zsh/keymaps.zsh

# [ Aliases ]
source $XDG_CONFIG_HOME/zsh/aliases.zsh

# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
# terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line

# Variable which sets elements of prompt's left side
PROMPT="%~ %u"

# Variable which sets elements of prompt's right side
RPROMPT=" %w"

