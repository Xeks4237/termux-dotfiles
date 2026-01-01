# [ Title with useful information ]
# Zsh-God prompt
# by Xeks4237: https://gitlab.com/Xeks4237
# Licensed under: MIT License

# Zsh substitutions:
# %F{} => Colors everything after it
# %f => Resets coloring after itself
# %~ => Current path relative to $HOME directory
# %n => Shows $USERNAME of the surrent user
# %m => Shows hostname up to the first `.' symbols
# %# => Shows "#" if shell is privileged, if not "%", its same as "%(!,#,%%)"
# %D{} => Shows customly formatted time, like soo "%H:%M:%S.%."
# %(?,,) => prompt condition for doing some logic, %(condition,true,false)

# Terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line

# [ Sourcing and Loading extra stuff ]
# Files with functions to use in prompt
source $XDG_CONFIG_HOME/zsh/prompt/functions_left-to-right.zsh
source $XDG_CONFIG_HOME/zsh/prompt/functions_right-to-left.zsh

# [ Prompt specific opts and Hooks for Functions ]
add-zsh-hook preexec prompt_zshgod_exectime-preexec
add-zsh-hook precmd prompt_zshgod_exectime-precmd
add-zsh-hook precmd prompt_zshgod_setup

# [ Global Usage Variables ]
# Variable which sets amount of exectime after exectime is not hided
PROMPT_ZSHGOD_EXECTIME_MIN=5

# Variable which allows to turn on/off simplified look of prompt, removed nerd font arrow symbhols
PROMPT_ZSHGOD_UI_SIMPLIFIED=false

# INFO: I used Catppuccin Mocha Colors from:
# https://github.com/catppuccin
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
    # Saves value of $EPOCHSECONDS before executing command to variable for function prompt_zshgod_exectime
    PROMPT_ZSHGOD_CMD_START=$EPOCHSECONDS
}

# Function which calculates exectime before drowing prompt
prompt_zshgod_exectime-precmd() {
    # Piece of code which calculated exectime before displaying prompt for prompt_zshgod_exectime function
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
    echo ""
    # print -P "%B$(prompt_zshgod_exectime)$(prompt_zshgod_git_info)$(prompt_zshgod_git_dirty)$(prompt_zshgod_git_branch)$(prompt_zshgod_current-pwd)$(prompt_zshgod_userandhost)%b"

    PROMPT="%B$(prompt_zshgod_time)$(prompt_zshgod_root-indicator)%b "

    RPROMPT="%B$(prompt_zshgod_exectime)$(prompt_zshgod_git_info)$(prompt_zshgod_git_dirty)$(prompt_zshgod_git_branch)$(prompt_zshgod_current-pwd)$(prompt_zshgod_userandhost)%b"
}

