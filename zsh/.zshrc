# [ Environment Variables ]
source ~/.config/zsh/environment.zsh

# [ Auto attach to zellij session ]
eval "$(zellij setup --generate-auto-start zsh)"

# [ Zinit plugin manager ]
source $XDG_CONFIG_HOME/zsh/zinit.zsh

# [ Powerlevel10k ]
# Enable Powerlevel10k instant prompt.
# Configurations, etc. must go below this block
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize Powerlevel10k prompt, run "p10k configure" or edit $XDG_CONFIG_HOME/zsh/p10k.zsh
[[ ! -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]] || source $XDG_CONFIG_HOME/zsh/p10k.zsh

# [ Keymaps ]
source $XDG_CONFIG_HOME/zsh/keymaps.zsh

# [ Aliases ]
source $XDG_CONFIG_HOME/zsh/aliases.zsh

# [ Completions Styling ]
# NOTE: tab completions are made using fzf-tab plugin

# Makes completions to use half case-sensitive matching
# Like "foo" equals to "FOO", but "FOO" doesn't equals to "foo"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

# Makes coloring for completions using ls color
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Turns off completions menu, because here it's replaced with fzf-tab plugin
zstyle ":completion:*" menu no

# Makes fzf-tab plugin to use fzf options variables
# Some options can break plugin, but after 3 years of using it I don't spotted any :3
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Enables fzf-tab completions for cd command
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --almost-all --human-readable --color=always $realpath"

# [ Shell integrations, completions and etc ]

# fzf
eval "$(fzf --zsh)"

# gh (github cli)
eval "$(gh completion --shell zsh)"

# gitleaks
eval "$(gitleaks completion zsh --verbose)"

# [ Command history ]

setopt appendhistory
setopt sharehistory

# Makes command history to ignore space
setopt hist_ignore_space

# Options to don't save duplicates in command history and it's file
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# [ etc ]

# Set theme for fast syntax highlyting plugin
fast-theme --quiet default
