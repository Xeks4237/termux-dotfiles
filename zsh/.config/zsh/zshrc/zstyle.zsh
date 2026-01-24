#!/usr/bin/env zsh
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

# Turns off completions menu, because its replaced with fzf-tab plugin
zstyle ':completion:*' menu select

# [ fzf-tab plugin ]
# Make fzf-tab to use tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Enable preview for cd completions with fzf-tab
# NOTE: I don't know why it wasn't working with eza before I setted 'realpath=$realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'realpath=$realpath eza -1 --almost-all --color=always $realpath'

# Extra fzf flags for fzf-tab if needed
# zstyle ':fzf-tab:*' fzf-flags ''

# How many lines does fzf's prompt occupies, set it to 4 if you use '--border' flag
zstyle ':fzf-tab:*' fzf-pad 2

# Define minimal height for fzf-tab when using fzf instead of tmux popup
zstyle ':fzf-tab:*' fzf-min-height 15

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
zstyle ':fzf-tab:*:*' popup-min-size 50 20

# Enbale smart tab feature of fzf-tab, its enabled by default
zstyle ':fzf-tab:*' popup-smart-tab yes

# Enable preview for values of environment variables while completing
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# Show systemd unit status
# NOTE: I added it for fun because I don't use systemd :P
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# Preview for actual command completions using smart ways
zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word" | bat -pP --theme="Catppuccin Mocha" --color=always --language=Manpage) 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

