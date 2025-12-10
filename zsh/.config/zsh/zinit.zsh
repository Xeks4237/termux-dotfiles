# [ Zinit Setup ]
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# [ Plugins ]
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

# [ Themes and Colorschemes ]
zinit ice depth=1; zinit light romkatv/powerlevel10k

# [ Snippets ]
# Oh-My-Zsh Lib snippets
zinit snippet OMZL::git.zsh

#  Oh-My-Zsh Plugin snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::copybuffer
zinit snippet OMZP::git/git.plugin.zsh

# [ Loading Section ]
# Completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Fish like history substring search
zinit load "zsh-users/zsh-history-substring-search"
zinit ice wait atload"_history_substring_search_config"

