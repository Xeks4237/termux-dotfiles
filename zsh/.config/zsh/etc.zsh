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

# gitleaks
eval "$(gitleaks completion zsh --verbose)"

# fast-syntax-highlyting plugin
fast-theme --quiet default

# [ Command history Opts ]
setopt appendhistory
setopt sharehistory

# Makes command history to ignore space
setopt hist_ignore_space

# Options to don't save duplicates in command history and it's file
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

