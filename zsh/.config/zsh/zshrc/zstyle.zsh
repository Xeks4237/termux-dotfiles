#!/bin/zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# NOTE: This file is sourced in '.zshrc'
# This file is used for setting custom zstyles of your interactive zsh instances
# And this file exists only for maintaining purposes

# INFO: For more about zstyle see 'zshall' mandoc page

# [ Default completions ]
# Makes completions to use half case-sensitive matching
# Like 'foo' equals to 'FOO', but 'FOO' doesn't equals to 'foo'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Makes coloring for completions using ls color
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

# Enables completions menu of zsh and makes it to have selectable entries
zstyle ':completion:*' menu select

# [ fzf-tab plugin ]
# Make fzf-tab to use tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Extra fzf flags for fzf-tab if needed
# zstyle ':fzf-tab:*' fzf-flags ''

# How many lines does fzf's prompt occupies
# NOTE: Set it to 4 if you use '--border' flag for fzf
zstyle ':fzf-tab:*' fzf-pad 2

# Define minimal height for fzf-tab when using fzf instead of tmux popup
zstyle ':fzf-tab:*' fzf-min-height 30

# It specifies the key to accept and run a suggestion in one keystroke
# zstyle ':fzf-tab:*' accept-line alt-enter

# Set key to autocomplete and continue completing
zstyle ':fzf-tab:*' continuous-trigger '/'

# Set key to use already written output as final completion
zstyle ':fzf-tab:*' print-query alt-enter

# Specifies keys to switch completions group of fzf-tab
# zstyle ':fzf-tab:*' switch-group F1 F2

# The strategy for generating query string
zstyle ':fzf-tab:*' query-string prefix input first

# Makes fzf-tab plugin to use default fzf options variables
# Some options can break plugin
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Define size for fzf-tab's tmux popup
zstyle ':fzf-tab:*' popup-min-size 60 30

# Enbale smart tab feature of fzf-tab, its enabled by default
zstyle ':fzf-tab:*' popup-smart-tab yes

# Enable preview for values of environment variables while completing
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'print ${(P)word}'

# Preview for actual command completions using smart ways
zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && print $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word" | bat -pP --color=always --language=Manpage) 2>/dev/null && print $out) || (out=$(which "$word") && print $out) || print "${(P)word}"'

# Custom zstyle for using eza for directories and bat for files in fzf-tab
zstyle ':fzf-tab:complete:(cd|ls|mv|rm|ln|touch|bat|eza|nvim|vim|cat):*' fzf-preview 'bat --tabs=4 --wrap=character --color=always --decorations=auto --paging=never --strip-ansi=auto --style=changes $realpath 2>/dev/null || eza --width=1 --across --almost-all --classify=always --color=always --grid --group-directories-first --icons=always --level=1 --sort=Name $realpath'

