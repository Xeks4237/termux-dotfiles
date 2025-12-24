# [ Loading Some Stuff ]
autoload -Uz vcs_info

# [ Colors ]
# prompt_colors() {
# NOTE: I used Catppuccin Mocha Colors from https://github.com/catppuccin
# Main colors
thm_rosewater="#f5e0dc"
thm_flamingo="#f2cdcd"
thm_pink="#f5c2e7"
thm_mauve="#cba6f7"
thm_red="#f38ba8"
thm_maroon="#eba0ac"
thm_peach="#fab387"
thm_yellow="#f9e2af"
thm_green="#a6e3a1"
thm_teal="#94e2d5"
thm_sky="#89dceb"
thm_sapphire="#74c7ec"
thm_blue="#89b4fa"
thm_lavender="#b4befe"

# Main surface and overlay colors
thm_subtext_1="#a6adc8"
thm_subtext_0="#bac2de"
thm_fg="#cdd6f4"
thm_overlay_2="#9399b2"
thm_overlay_1="#7f849c"
thm_overlay_0="#6c7086"
thm_surface_2="#585b70"
thm_surface_1="#45475a"
thm_surface_0="#313244"
thm_mantle="#181825"
thm_crust="#11111b"
thm_bg="#1e1e2e"
# }

# [ Functions ]

# [ Final Prompt Scructure ]
# %F{} => Colors everything after it
# %f => Resets coloring after itself
# %~ => Current path relative to $HOME directory
# %n => Shows $USERNAME of the surrent user
# %m => Shows hostname up to the first `.'
# %# => Shows "#" if shell is privileged, if not "%", its same as "%(!,#,%%)"
# %D{} => Shows customly formatted time, like soo "%H:%M:%S.%."
# %(?..) => prompt condition for doing some logic, %(condition.true.false)

# Terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line

# Variable which sets elements of prompt's left side
PROMPT="%F{$thm_sky}%~%f %(!,%F{$thm_red}#%f,%F{$thm_sky}%%%f) %F{$thm_lavender}=>%f "

# Variable which sets elements of prompt's right side
RPROMPT=" %F{$thm_yellow}%D{ %H\h %M\m %S\s}%f %F{$thm_yellow}%n%f%F{$thm_sky}@%f%F{$thm_green}%m%f"

