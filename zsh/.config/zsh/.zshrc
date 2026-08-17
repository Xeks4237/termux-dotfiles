# INFO: This file is sourced by every interactive instance of zsh

# [ Environment variables ]
# Path
typeset -gx PATH="$PREFIX/bin/:$CARGO_HOME/bin/:$XDG_BIN_HOME"

# Variable which sets history file of zsh
typeset -gx HISTFILE="$ZDOTDIR/.zsh_history"

# Variable which sets max length of history and history file
typeset -gx HISTSIZE=10000
typeset -gx SAVEHIST=$HISTSIZE

# Customize The prompt used for spelling correction
typeset -g SPROMPT="%F{003}Correct %f%F{001}%R%f%F{003} to %f%F{002}%r%f%F{003}? [%f%F{001}n%f%F{002}y%f%F{001}a%f%F{004}e%f%F{003}]:%f"

# Variable which sets indentation of prompts right side from window border
typeset -g ZLE_RPROMPT_INDENT=0

# Variable which sets home directory of zplug plugin manager for zsh
typeset -gx ZPLUG_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zplug/"

# [ Section for random shi... small pieces of code ]
# Autoload zsh functions/tools/featues
autoload -Uz add-zsh-hook \
	colors \
	zmv \
	tetriscurses \
	compinit \
	promptinit

# Initialize completion and prompt system
compinit; promptinit

# Initialize shell integration of tv
eval "$(tv init zsh)"

# Snippet which bootstraps zplug if not already present
[[ ! -d $ZPLUG_HOME ]] && mkdir -p "$(dirname $ZPLUG_HOME)"
[[ ! -d $ZPLUG_HOME/.git ]] && git clone --depth=1 https://github.com/zplug/zplug.git "$ZPLUG_HOME"
source "$ZPLUG_HOME/init.zsh"

# Zplug commands to install zsh plugins with extra settings
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-completions', as:plugin
zplug 'zsh-users/zsh-autosuggestions', as:plugin
zplug 'zdharma-continuum/fast-syntax-highlighting', as:plugin, hook-load:'fast-theme --quiet $ZDOTDIR/xeks.ini'
# My own plugin, btw :3
zplug 'Xeks4237/ZshGod', as:plugin, hook-load:'prompt zshgod --theme=flat --min-exectime=5'

# Make sure plugins are installed/up-to-date
if ! zplug check; then
	zplug install
fi

# Load zplug plugins
zplug load

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

# [ Keymaps ]
# Enable vi style keymaps
# Same thing as overwriting main mode with keymaps of viins mode using
# this command: bindkey -N main viins
bindkey -v

# Sets Home key to move cursor to the beginning of line in current main mode
bindkey '^[[1~' beginning-of-line

# Sets End key to move cursor to the beginning of line in current main mode
bindkey '^[[4~' end-of-line

# Makes delete to properly delete 1 character after the cursor in viins mode
bindkey '^[[3~' delete-char

# Makes backspace to work after returning to viins mode from normal mode
bindkey '^?' backward-delete-char

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
