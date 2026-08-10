# This file is sourced in '.zshrc'

# Alias for ls
alias ls='ls --almost-all --color=always --classify=always --group-directories-first --human-readable'

# Alias for tree
alias tree='tree --opt-toggle -aphCF -L1 --metafirst --dirsfirst --du'

# Alias for eza
alias eza='eza --across --almost-all --classify=always --color=always --context --extended --git --git-repos --grid --group-directories-first --header --icons=always --level=1 --long --no-time --sort=Name --time-style=long-iso --total-size --no-permissions --octal-permissions'

# Alias for wget
alias wget="wget --hsts-file=${XDG_DATA_HOME:-$HOME/.local/share/}/wget/wget-hsts"

# Alias for rm
alias rm='rm -v'

# Alias for builtin stat/gstat alternative of zsh
alias zstat="zstat -tsrnL -F'%T %Z %d/%m/%Y'"
