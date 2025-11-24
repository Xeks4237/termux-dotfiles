# [ Environment Variables ]
# Configurations directory
XDG_CONFIG_HOME="$HOME/.config"
# PATH
PATH=$PATH:$HOME/.local/bin/:$HOME/Scripts/
# Language
LANG=ru_RU.UTF-8
# Auto exit Terminal after closing zellij
ZELLIJ_AUTO_EXIT=true
# Auto attach to the zellij session if available, else create new session
ZELLIJ_AUTO_ATTACH=false
# "fzf default options" environment variable
export FZF_DEFAULT_OPTS_FILE=$XDG_CONFIG_HOME/fzf/fzf-options
# Set default editor which gonna be used by other app
EDITOR="nvim"

# Set the directory where we want to store zinit plugin manager and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Auto start zellij and attach to it
eval "$(zellij setup --generate-auto-start zsh)"

# Enable Powerlevel10k instant prompt.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# [ Zinit Setup ]
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k as plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::copybuffer

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# [ Keybindings ]
# enable default vi style keymaps
bindkey -v
# Sets Home key to move cursor the beginning of line
bindkey "^[[H" beginning-of-line
# Sets End key to move cursor the beginning of line
bindkey "^[[F" end-of-line
# etc
bindkey "^[w" kill-region
bindkey "^[[3~" delete-char

# [ History ]
# Max length of command history
HISTSIZE=10000
HISTFILE=$XDG_CONFIG_HOME/zsh/zsh_history # Location of history file
SAVEHIST=$HISTSIZE # Sets max length of history file to the max  length of command history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# [ Completion Styling ]
# Makes fzf-tab plugin to use default fzf opts variable (some opts can break plugin)
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# Makes completions to use half case-sensative matching
# Like "foo" equals to "FOO", but "FOO" doesn't equals to "foo"
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --almost-all --human-readable --color=always $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color=always $realpath"

# [ Aliases ]
alias ls="ls --classify --almost-all --human-readable --color=always"
alias ls="echo 'nuh uh >:3, use tree instead!'" # tmp keymap to force myself to use tree instead of ls
alias cat="cat -n"
alias wine="wine-stable"
# ad -gu in case of file owners*
alias tree="tree --opt-toggle -ahpCDF -L1 --metafirst --dirsfirst --du"

# [ Shell integrations ]
eval "$(fzf --zsh)" # fzf
eval "$(gitleaks completion zsh --verbose)" # gitleaks

# To customize prompt, run "p10k configure" or edit ~/.config/zsh/p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

