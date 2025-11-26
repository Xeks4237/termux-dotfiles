# [ Aliases ]

alias ls="ls --almost-all --color=always --classify=always --group-directories-first --human-readable"

# tmp keymap to force myself to use tree instead of ls
alias ls="echo 'nuh uh >:3, use tree instead!'"

alias cat="cat -n"

alias wine="wine-stable"

# NOTE: I know that I added two -h in alias
# Add -gu flag to tree in case to see file owners of files
# And -D for date, -h for file size, and etc
alias tree="tree --opt-toggle -aphCF -L1 --metafirst --dirsfirst --du"

