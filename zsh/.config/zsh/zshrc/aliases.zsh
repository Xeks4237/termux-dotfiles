#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# This file is sourced in '.zshrc'
# This file is meant for setting aliases of your interactive zsh instances
# And this file exists only for maintaining purposes

# Alias for ls
alias ls='ls --almost-all --color=always --classify=always --group-directories-first --human-readable'

# Alias for tree
alias tree='tree --opt-toggle -aphCF -L1 --metafirst --dirsfirst --du'

# Alias for eza
alias eza='eza --across --almost-all --classify=always --color=always --context --extended --git --git-repos --grid --group-directories-first --header --icons=always --level=1 --long --no-time --sort=Name --time-style=long-iso --total-size'

# Alias to wine-stable
alias wine='wine-stable'

# Alias for wget
alias wget="wget --hsts-file=${XDG_DATA_HOME:-$HOME/.local/share/}/wget/wget-hsts"

# Alias for rm
alias rm='rm -v'
