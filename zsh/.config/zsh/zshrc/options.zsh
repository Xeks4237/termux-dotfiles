#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# This file is sourced in '.zshrc'
# This file is used for (un)setting options of your interactive zsh instances
# And this file exists only for maintaining purposes

# [ Disabled options for Zsh ]
# If a command is issued that can't be executed as a normal
# command, and the command is the name of a directory, perform
# the cd command to that directory.  This option is only
# applicable if the option SHIN_STDIN is set, i.e. if commands
# are being read from standard input.  The option is designed
# for interactive use; it is recommended that cd be used
# explicitly in scripts to avoid ambiguity
unsetopt AUTO_CD

# [ Enabled options for Zsh ]
# Enable command substitution in prompt
setopt PROMPTSUBST

# Changes how history is shared and appended
setopt APPENDHISTORY
setopt SHAREHISTORY

# Makes command history to ignore space
setopt HIST_IGNORE_SPACE

# Options to don't save duplicates in command history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
