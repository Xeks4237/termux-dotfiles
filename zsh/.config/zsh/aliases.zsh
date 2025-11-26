# [ Aliases ]

alias ls="ls --classify --almost-all --human-readable --color=always"

# tmp keymap to force myself to use tree instead of ls
alias ls="echo 'nuh uh >:3, use tree instead!'"

alias cat="cat -n"

alias wine="wine-stable"

# NOTE: Add -gu flag to tree in case to see file owners of files
# and -D for date and etc
alias tree="tree --opt-toggle -ahpCF -L1 --metafirst --dirsfirst --du"
