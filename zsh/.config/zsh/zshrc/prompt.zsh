# [ Title with useful information ]
# Zsh-God Prompt
# Made by Xeks4237: https://gitlab.com/Xeks4237
# Licensed under: MIT License

# Zsh substitutions (To get more info check mandoc of zsh):
# %F{} => Changes foreground color of text after itself, excepts HEX values for color
# %K{} => Changes background color of text after itself, excepts HEX values for color
# %f => Resets foreground coloring after itself
# %k => Resets background coloring after itself
# %B => Makes text after itself to bold
# %b => Resets 'boldness' effect of text caused by %B
# %D{} => Shows customly formatted time, like soo '%H:%M:%S.%.'
# %~ => Current path relative to $HOME directory
# %n => Shows $USERNAME of the surrent user
# %m => Shows hostname up to the first `.' symbols
# %# => Shows '#' if shell is privileged, if not '%', its same as %(!,#,%%)
# %(?,,) => prompt condition for doing some logic, %(condition,true,false)

# [ List of custom functions ]
# These are functions which are after being called or evaluated
# will return one of the customly made pieces of prompt
# They are used in 'prompt_zshgod_setup' function in end of this file
# Each of functions are written inside of $() to evaluate its functionality
# instead of just printing its name
# TODO: make '--help' or 'prompt_zshgod_help' function for help

# [ Sourcing and Loading extra stuff ]
# Zsh module related to zle hooks
autoload -Uz add-zle-hook-widget add-zsh-hook

# Builtin zsh module for getting basic info from vcs systems
autoload -Uz vcs_info

# Allows using command substitutions in prompt variable directly
setopt PROMPT_SUBST

# Files with functions to use in prompt
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/prompt-libraries/functions_left-to-right_arrowed.zsh"
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/prompt-libraries/functions_right-to-left_arrowed.zsh"
source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh/}/prompt-libraries/functions_rectangular.zsh"

# [ Prompt specific opts and Hooks for Functions ]
add-zsh-hook preexec prompt_zshgod_exectime-preexec
add-zsh-hook precmd prompt_zshgod_exectime-precmd
add-zsh-hook precmd prompt_zshgod_setup

# [ Global Usage Variables ]
# Variable which sets amount of exectime after exectime is not hided
PROMPT_ZSHGOD_EXECTIME_MIN=5

# Variable to easily toggle multilined prompt
PROMPT_ZSHGOD_MULTILENE=false

# Variable which set frequency with prompt gets redrawn
PROMPT_ZSHGOD_AUTOREDRAW_FREQUENCY=1

# Builtin variable which sets indentation for prompts right side
ZLE_RPROMPT_INDENT=0

# INFO: I used Catppuccin Mocha Colors from: https://github.com/catppuccin
# Main colors
export ZSH_THM_ROSEWATER='#F5E0DC'
export ZSH_THM_FLAMINGO='#F2CDCD'
export ZSH_THM_PINK='#F5C2E7'
export ZSH_THM_MAUVE='#CBA6F7'
export ZSH_THM_RED='#F38BA8'
export ZSH_THM_MAROON='#EBA0AC'
export ZSH_THM_PEACH='#FAB387'
export ZSH_THM_YELLOW='#F9E2AF'
export ZSH_THM_GREEN='#A6E3A1'
export ZSH_THM_TEAL='#94E2D5'
export ZSH_THM_SKY='#89DCEB'
export ZSH_THM_SAPPHIRE='#74C7EC'
export ZSH_THM_BLUE='#89B4FA'
export ZSH_THM_LAVENDER='#B4BEFE'

# Main surface and overlay colors
export ZSH_THM_SUBTEXT_1='#A6ADC8'
export ZSH_THM_SUBTEXT_0='#BAC2DE'
export ZSH_THM_FOREGROUND='#CDD6F4'
export ZSH_THM_OVERLAY_2='#9399B2'
export ZSH_THM_OVERLAY_1='#7F849C'
export ZSH_THM_OVERLAY_0='#6C7086'
export ZSH_THM_SURFACE_2='#585B70'
export ZSH_THM_SURFACE_1='#45475A'
export ZSH_THM_SURFACE_0='#313244'
export ZSH_THM_MANTLE='#181825'
export ZSH_THM_CRUST='#11111B'
export ZSH_THM_BACKGROUND='#1E1E2E'

# [ Functions needed for other functions which don't have visual look ]
# Function which captures exectime before executing every command
prompt_zshgod_exectime-preexec() {
    # Saves value of $EPOCHSECONDS before executing command to variable
    # Its for prompt_zshgod_exectime function
    PROMPT_ZSHGOD_CMD_START=$EPOCHSECONDS
}

# Function which calculates exectime before drowing prompt
prompt_zshgod_exectime-precmd() {
    # Piece of code which calculated exectime before displaying prompt
    # Its for prompt_zshgod_exectime function
    if (( ${+PROMPT_ZSHGOD_CMD_START} )); then
        PROMPT_ZSHGOD_CMD_DURATION=$(( EPOCHSECONDS - PROMPT_ZSHGOD_CMD_START ))
        unset PROMPT_ZSHGOD_CMD_START
    else
        unset PROMPT_ZSHGOD_CMD_DURATION
    fi
}

# [ Prompt Scructure ]
# Function where all other functions are used to make prompt
prompt_zshgod_setup() {
    # Echo nothing before setting up prompt to make it sparce
    echo ''

    # Checks if 'PROMPT_ZSHGOD_MULTILENE' is equal to true
    # and outputs extra line for making prompt multilined
    if [[ $PROMPT_ZSHGOD_MULTILENE == true ]]; then
        # 'print' command with -P flag to output PROMPT like stuff before actuall prompt
        print -P '%B$(prompt_zshgod_left-to-right_current-pwd)$(prompt_zshgod_left-to-right_git_branch)$(prompt_zshgod_left-to-right_git_info)$(prompt_zshgod_left-to-right_git_dirty)$(prompt_zshgod_left-to-right_exectime)%b'
    fi

    # Variable which sets left side of prompt
    PROMPT='%B$(prompt_zshgod_left-to-right_time)$(prompt_zshgod_left-to-right_root-indicator)%b '

    # Variable which sets right side of prompt
    RPROMPT='%B$(prompt_zshgod_right-to-left_exectime)$(prompt_zshgod_right-to-left_git_info)$(prompt_zshgod_right-to-left_git_branch)$(prompt_zshgod_right-to-left_current-pwd)$(prompt_zshgod_right-to-left_sshonly_userandhostname)%b'
}

