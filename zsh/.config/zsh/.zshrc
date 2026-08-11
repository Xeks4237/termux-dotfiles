# INFO: This file is sourced by every interactive instance of zsh

# [ Environment variables ]
# Path
PATH="$PREFIX/bin/:$CARGO_HOME/bin/:$XDG_BIN_HOME"

# Variable which sets history file of zsh
HISTFILE="$ZDOTDIR/.zsh_history"

# Variable which sets max length of history and history file
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# Customize command typo
SPROMPT="%F{003}Correct %f%F{001}%R%f%F{003} to %f%F{002}%r%f%F{003}? [%f%F{001}n%f%F{002}y%f%F{001}a%f%F{004}e%f%F{003}]:%f"

ZLE_RPROMPT_INDENT=0

# NOTE: I hate adding "etc" like sections >:(
# [ Section for random shi... small pieces of code ]
# Snippet which bootstraps zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
[[ ! -d $ZINIT_HOME ]] && mkdir -p "$(dirname $ZINIT_HOME)"
[[ ! -d $ZINIT_HOME/.git ]] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

# Autoload zsh functions/tools/featues
autoload -Uz add-zsh-hook \
	colors \
	zmv \
	tetriscurses \
	compinit \
	promptinit

# Initialize completion and prompt system
compinit; promptinit

# Command to add fzf integration to zsh
# TODO: Change it to tv later
eval "$(fzf --zsh)"

# Zinit commands to install zsh plugins
zinit light 'Aloxaf/fzf-tab'
zinit light 'Freed-Wu/fzf-tab-source'
zinit light 'zsh-users/zsh-completions'
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zdharma-continuum/fast-syntax-highlighting'
zinit light 'Xeks4237/ZshGod'

# Choose my custom fast syntax highlighting config
fast-theme --quiet $ZDOTDIR/xeks.ini

# Choose the theme of zsh prompt, sets it to my own plugin btw :]
prompt zshgod --theme=flat --min-exectime=5

# [ Shell options ]
# NOTE: Yes I love zsh enough to ACTUALLY read ALL zsh manpages fully
# Set/Enable options
setopt AUTO_PUSHD \
	CD_SILENT \
	POSIX_CD \
	PUSHD_SILENT \
	PUSHD_TO_HOME \
	ALWAYS_LAST_PROMPT \
	ALWAYS_TO_END \
	AUTO_LIST \
	AUTO_MENU \
	AUTO_NAME_DIRS \
	AUTO_PARAM_KEYS \
	AUTO_PARAM_SLASH \
	COMPLETE_ALIASES \
	HASH_LIST_ALL \
	LIST_AMBIGUOUS \
	LIST_ROWS_FIRST \
	LIST_TYPES \
	MENU_COMPLETE \
	REC_EXACT \
	BARE_GLOB_QUAL \
	BRACE_CCL \
	CASE_GLOB \
	EQUALS \
	EXTENDED_GLOB \
	GLOB \
	GLOB_DOTS \
	GLOB_STAR_SHORT \
	GLOB_SUBST \
	HIST_SUBST_PATTERN \
	MAGIC_EQUAL_SUBST \
	MARK_DIRS \
	MULTIBYTE \
	NUMERIC_GLOB_SORT \
	RC_EXPAND_PARAM \
	REMATCH_PCRE \
	UNSET \
	APPEND_HISTORY \
	EXTENDED_HISTORY \
	HIST_BEEP \
	HIST_FCNTL_LOCK \
	HIST_FIND_NO_DUPS \
	HIST_IGNORE_SPACE \
	HIST_LEX_WORDS \
	HIST_REDUCE_BLANKS \
	HIST_SAVE_BY_COPY \
	HIST_VERIFY \
	INC_APPEND_HISTORY_TIME \
	SHARE_HISTORY \
	GLOBAL_EXPORT \
	GLOBAL_RCS \
	RCS \
	ALIASES \
	CLOBBER \
	CLOBBER_EMPTY \
	CORRECT \
	CORRECT_ALL \
	FLOW_CONTROL \
	INTERACTIVE_COMMENTS \
	HASH_CMDS \
	HASH_DIRS \
	HASH_EXECUTABLES_ONLY \
	MAIL_WARNING \
	PATH_DIRS \
	PATH_SCRIPT \
	PRINT_EXIT_VALUE \
	RC_QUOTES \
	RM_STAR_WAIT \
	SHORT_LOOPS \
	SHORT_REPEAT \
	AUTO_CONTINUE \
	BG_NICE \
	CHECK_JOBS \
	CHECK_RUNNING_JOBS \
	HUP \
	LONG_LIST_JOBS \
	MONITOR \
	POSIX_JOBS \
	PROMPT_BANG \
	PROMPT_CR \
	PROMPT_SP \
	PROMPT_PERCENT \
	PROMPT_SUBST \
	C_BASES \
	C_PRECEDENCES \
	DEBUG_BEFORE_CMD \
	EVAL_LINENO \
	EXEC \
	FUNCTION_ARGZERO \
	LOCAL_LOOPS \
	LOCAL_PATTERNS \
	MULTI_FUNC_DEF \
	MULTIOS \
	PIPE_FAIL \
	APPEND_CREATE \
	BSD_ECHO \
	KSH_OPTION_PRINT \
	POSIX_ALIASES \
	POSIX_BUILTINS \
	SH_FILE_EXPANSION \
	SH_NULLCMD \
	SH_OPTION_LETTERS \
	SH_WORD_SPLIT \
	TRAPS_ASYNC \
	BEEP \
	COMBINING_CHARS \
	VI \
	ZLE

# Unset/Disable options
unsetopt AUTO_CD \
	CDABLE_VARS \
	CHASE_DOTS \
	CHASE_LINKS \
	PUSHD_IGNORE_DUPS \
	PUSHD_MINUS \
	AUTO_REMOVE_SLASH \
	BASH_AUTO_LIST \
	COMPLETE_IN_WORD \
	GLOB_COMPLETE \
	LIST_BEEP \
	LIST_PACKED \
	BAD_PATTERN \
	CASE_MATCH \
	CASE_PATHS \
	CSH_NULL_GLOB \
	FORCE_FLOAT \
	GLOB_ASSIGN \
	IGNORE_BRACES \
	IGNORE_CLOSE_BRACES \
	KSH_GLOB \
	NOMATCH \
	NULL_GLOB \
	SH_GLOB \
	WARN_CREATE_GLOBAL \
	WARN_NESTED_VAR \
	BANG_HIST \
	HIST_ALLOW_CLOBBER \
	HIST_EXPIRE_DUPS_FIRST \
	HIST_IGNORE_ALL_DUPS \
	HIST_IGNORE_DUPS \
	HIST_NO_FUNCTIONS \
	HIST_NO_STORE \
	HIST_SAVE_NO_DUPS \
	INC_APPEND_HISTORY \
	ALL_EXPORT \
	IGNORE_EOF \
	PRINT_EIGHT_BIT \
	RM_STAR_SILENT \
	SUN_KEYBOARD_HACK \
	AUTO_RESUME \
	NOTIFY \
	TRANSIENT_RPROMPT \
	ALIAS_FUNC_DEF \
	ERR_EXIT \
	ERR_RETURN \
	LOCAL_OPTIONS \
	LOCAL_TRAPS \
	OCTAL_ZEROES \
	SOURCE_TRACE \
	TYPESET_SILENT \
	TYPESET_TO_UNSET \
	VERBOSE \
	XTRACE \
	BASH_REMATCH \
	CONTINUE_ON_ERROR \
	CSH_JUNKIE_HISTORY \
	CSH_JUNKIE_LOOPS \
	CSH_JUNKIE_QUOTES \
	CSH_NULLCMD \
	KSH_ARRAYS \
	KSH_AUTOLOAD \
	KSH_TYPESET \
	KSH_ZERO_SUBSCRIPT \
	POSIX_ARGZERO \
	POSIX_IDENTIFIERS \
	POSIX_STRINGS \
	POSIX_TRAPS \
	EMACS

# [ Zstyle ]
# Makes completions to use half case-sensitive matching
# Like 'foo' equals to 'FOO', but 'FOO' doesn't equals to 'foo'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Makes coloring for completions using ls color
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

# Enables completions menu of zsh and makes it to have selectable entries
zstyle ':completion:*' menu select

# Make fzf-tab to use tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Extra fzf flags for fzf-tab if needed
# zstyle ':fzf-tab:*' fzf-flags ''

# How many lines does fzf's prompt occupies
# NOTE: Set it to 4 if you use '--border' flag for fzf
zstyle ':fzf-tab:*' fzf-pad 2

# Define minimal height for fzf-tab when using fzf instead of tmux popup
zstyle ':fzf-tab:*' fzf-min-height 30

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
zstyle ':fzf-tab:*' popup-min-size 60 30

# Enbale smart tab feature of fzf-tab, its enabled by default
zstyle ':fzf-tab:*' popup-smart-tab yes

# Enable preview for values of environment variables while completing
zstyle ':fzf-tab:complete:(-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'print ${(P)word}'

# Preview for actual command completions using smart ways
zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && print $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word" | bat -pP --color=always --language=Manpage) 2>/dev/null && print $out) || (out=$(which "$word") && print $out) || print "${(P)word}"'

# Custom zstyle for using eza for directories and bat for files in fzf-tab
zstyle ':fzf-tab:complete:(cd|ls|mv|rm|ln|touch|bat|eza|nvim|cat):*' fzf-preview 'bat --tabs=4 --wrap=character --color=always --decorations=auto --paging=never --strip-ansi=auto --style=changes $realpath 2>/dev/null || eza --width=1 --across --almost-all --classify=always --color=always --grid --group-directories-first --icons=always --level=1 --sort=Name $realpath'

# [ Keymaps ]
# Enable vi style keymaps
# Same thing as overwriting main mode with keymaps of viins mode using
# this command: bindkey -N main viins
bindkey -N main viins
# bindkey -v

# Sets Home key to move cursor to the beginning of line in current main mode
bindkey -M main '^[[1~' beginning-of-line
# Same thing but for vi normal modes
bindkey -M vicmd '^[[1~' beginning-of-line

# Sets End key to move cursor to the beginning of line in current main mode
bindkey -M main '^[[4~' end-of-line
# Same thing but for vi normal mode
bindkey -M vicmd '^[[4~' end-of-line

# Makes delete to properly delete 1 character after the cursor in viins mode
bindkey -M viins '^[[3~' delete-char

# Makes backspace to work after returning to viins mode from normal mode
bindkey -M viins '^?' backward-delete-char

# [ Aliases ]
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
