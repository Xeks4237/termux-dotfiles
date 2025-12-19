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

# [ Custom Zsh Prompt based on https://github.com/sindresorhus/pure ]
fpath+=($XDG_CONFIG_HOME/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

