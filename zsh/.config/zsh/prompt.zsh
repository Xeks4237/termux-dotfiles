# [ Title with useful information ]
# Zsh-God Prompt
# Made by Xeks4237: https://gitlab.com/Xeks4237
# Licensed under: MIT License

# Uses zsh-async library from: https://github.com/mafredri/zsh-async

# Zsh substitutions:
# %F{} => Changes foreground color of text after itself, excepts HEX values for color
# %K{} => Changes background color of text after itself, excepts HEX values for color
# %f => Resets foreground coloring after itself
# %k => Resets background coloring after itself
# %B => Makes text after itself to bold
# %b => Resets "boldness" effect of text caused by %B
# %D{} => Shows customly formatted time, like soo "%H:%M:%S.%."
# %~ => Current path relative to $HOME directory
# %n => Shows $USERNAME of the surrent user
# %m => Shows hostname up to the first `.' symbols
# %# => Shows "#" if shell is privileged, if not "%", its same as %(!,#,%%)
# %(?,,) => prompt condition for doing some logic, %(condition,true,false)

# [ Sourcing and Loading extra stuff ]
# Some zsh's zle hook for zle widgets
autoload -z add-zle-hook-widget

# Allows using command substitutions in prompt variable directly
setopt promptsubst

# Files with functions to use in prompt
source $XDG_CONFIG_HOME/zsh/prompt-libraries/functions_left-to-right_arrowed.zsh
source $XDG_CONFIG_HOME/zsh/prompt-libraries/functions_right-to-left_arrowed.zsh
source $XDG_CONFIG_HOME/zsh/prompt-libraries/functions_rectangular.zsh

# async library to make prompt asynchronous
source $XDG_CONFIG_HOME/zsh/prompt-libraries/async.zsh

# Initialise async library
async_init

# [ Prompt specific opts and Hooks for Functions ]
add-zsh-hook preexec prompt_zshgod_exectime-preexec
add-zsh-hook precmd prompt_zshgod_exectime-precmd
add-zsh-hook precmd prompt_zshgod_setup

# [ Global Usage Variables ]
# Variable which sets amount of exectime after exectime is not hided
PROMPT_ZSHGOD_EXECTIME_MIN=5

# INFO: I used Catppuccin Mocha Colors from: https://github.com/catppuccin
# Main colors
prompt_thm_rosewater="#f5e0dc"
prompt_thm_flamingo="#f2cdcd"
prompt_thm_pink="#f5c2e7"
prompt_thm_mauve="#cba6f7"
prompt_thm_red="#f38ba8"
prompt_thm_maroon="#eba0ac"
prompt_thm_peach="#fab387"
prompt_thm_yellow="#f9e2af"
prompt_thm_green="#a6e3a1"
prompt_thm_teal="#94e2d5"
prompt_thm_sky="#89dceb"
prompt_thm_sapphire="#74c7ec"
prompt_thm_blue="#89b4fa"
prompt_thm_lavender="#b4befe"

# Main surface and overlay colors
prompt_thm_subtext_1="#a6adc8"
prompt_thm_subtext_0="#bac2de"
prompt_thm_fg="#cdd6f4"
prompt_thm_overlay_2="#9399b2"
prompt_thm_overlay_1="#7f849c"
prompt_thm_overlay_0="#6c7086"
prompt_thm_surface_2="#585b70"
prompt_thm_surface_1="#45475a"
prompt_thm_surface_0="#313244"
prompt_thm_mantle="#181825"
prompt_thm_crust="#11111b"
prompt_thm_bg="#1e1e2e"

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
    # Echo nothing before setting up prompt to make it have extra sparce
    echo ""

    # Print command with -P flag to make multiline prompt
    print -P "%B╭$(prompt_zshgod_left-to-right_current-pwd)$(prompt_zshgod_left-to-right_git_branch)$(prompt_zshgod_left-to-right_git_dirty)$(prompt_zshgod_left-to-right_git_info)$(prompt_zshgod_left-to-right_exectime)%b"

    # Variable which sets left side of prompt
    PROMPT="%B╰$(prompt_zshgod_left-to-right_time)$(prompt_zshgod_left-to-right_root-indicator)%b "

    # Variable which sets right side of prompt
    RPROMPT="%B$(prompt_zshgod_right-to-left_userandhostname)%b"
}

