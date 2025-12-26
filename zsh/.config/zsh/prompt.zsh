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

# NOTE: I used Catppuccin Mocha Colors from:
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

prompt_git_dirty() {
    if [[ $PROMPT_GIT_INFO == false ]]; then
        return
    fi
    # Checks if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Checks if it's dirty
    local umode="-uno"
    command test -n "$(git status --porcelain --ignore-submodules ${umode} 2>/dev/null | head -100)"

    # Echo "*" if repo is dirty
    (($? == 0)) && echo "*"
}

add-zsh-hook preexec prompt_git_dirty
add-zsh-hook precmd prompt_git_dirty

# [ Prompt Scructure ]
PROMPT="%F{$prompt_thm_yellow}%D{%H:%M:%S}%f %(!,%F{$prompt_thm_red}#%f,%F{$prompt_thm_green}%%%f) %F{$prompt_thm_lavender}=>%f "

RPROMPT=" $(prompt_git_dirty) %F{$prompt_thm_blue}%~%f"

