# [ Environment Variables ]
XDG_CONFIG_HOME="$HOME/.config" # Configurations directory
PATH=$PATH:$HOME/.local/bin/:$HOME/scripts/ # PATH
LANG=ru_RU.UTF-8 # Set language
ZELLIJ_AUTO_EXIT=true # Auto exit Terminal after closing zellij
ZELLIJ_AUTO_ATTACH=false # Auto attach to the zellij session if available, else create new session
# fzf related options
export FZF_DEFAULT_OPTS=" \
--color='bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8' \
--color='fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC' \
--color='marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8' \
--color='selected-bg:#45475A' \
--color='border:#6C7086,label:#CDD6F4' \
--style=full:rounded \
--multi \
--preview='cat -n {}' \
--layout=reverse"

# Set the directory where we want to store zinit plugin manager and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Auto start zellij and attach to it
# eval "$(zellij setup --generate-auto-start zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of zshrc.
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

# Add in Powerlevel10k
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
bindkey -v # vi style keymaps
bindkey "^[w" kill-region
bindkey "^[[H" beginning-of-line # Sets Home key to move cursor the beginning of line
bindkey "^[[F" end-of-line # Sets End key to move cursor the beginning of line
bindkey "^[[3~" delete-char

# [ History ]
HISTSIZE=10000 # Max length of command history
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
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color=always $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color=always $realpath"
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# [ Aliases ]
alias ls="ls --almost-all --color=always"
alias la="ls --almost-all -l --human-readable --color=always"
alias cat="cat -n"
alias wine="wine-stable"

# [ Shell integrations ]
eval "$(fzf --zsh)" # fzf
eval "$(gitleaks completion zsh --verbose)" # gitleaks

# To customize prompt, run "p10k configure" or edit ~/.config/zsh/p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

