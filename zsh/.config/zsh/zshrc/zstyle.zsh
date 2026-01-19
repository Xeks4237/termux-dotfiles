#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# NOTE: This file is sourced in '.zshrc'
# This file is used for setting custom zstyles of your interactive zsh instances
# And this file exists only for maintaining purposes

# INFO: For more about zstyle see 'zshall' mandoc page

# Makes completions to use half case-sensitive matching
# Like "foo" equals to "FOO", but "FOO" doesn't equals to "foo"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

# Makes coloring for completions using ls color
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Turns off completions menu, because its replaced with fzf-tab plugin
zstyle ":completion:*" menu select

# Makes fzf-tab plugin to use fzf options variables
# Some options can break plugin
# but after 4 years of using it I don't spotted any :3
zstyle ":fzf-tab:*" use-fzf-default-opts yes

# Enables fzf-tab completions for 'cd' command, and use 'ls' for preview
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --almost-all --human-readable --color=always $realpath"

