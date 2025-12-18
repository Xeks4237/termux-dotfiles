# [ Window & Pane Options ]
# When "window-size" is "smallest", whether the maximum size of a window is the smallest attached session where it is the current window ("on") or the smallest session it is linked to ("off")
# NOTE: Super useful when using "grouped sessions" and multi-monitor setup
set -g aggressive-resize on

# Whether applications are allowed to use the escape sequence to bypass tmux
# Can be "off" (disallowed), "on" (allowed if the pane is visible), or "all" (allowed even if the pane is invisible)
set -g allow-passthrough on

# Whether applications are allowed to use the escape sequence to rename tmux windows
set -g allow-rename on

# Whether applications are allowed to use the escape sequence to set the pane title in tmux
set -g allow-set-title on

# Whether applications are allowed to use the alternate screen
set -g alternate-screen on

# Whether windows are automatically renamed
set -g automatic-rename on

# Format used to automatically rename windows
# NOTE: I not gonna use this option for while...
# set -g automatic-rename-format ""

# Color of the clock in clock mode
set -g clock-mode-colour "#b4befe"

# Time format of the clock in clock mode
set -g clock-mode-style "24-with-seconds"

# Style of the current search match in copy mode
set -g copy-mode-current-match-style "bg=#{@thm_red},fg=#{@thm_crust}"

# Style of the marked line in copy mode
set -g copy-mode-mark-style "bg=#{@thm_red},fg=#{@thm_crust}"

# Style of search matches in copy mode
set -g copy-mode-match-style "bg=#{@thm_sky},fg=#{@thm_crust}"

# Format of the position indicator in copy mode
# TODO: Gonna configure this option to have custom look with better info on it than default later...
# set -g copy-mode-position-format "#[align=right]#{t/p:top_line_time}#{?#{e|>:#{top_line_time},0},,}[#{scroll_position}/#{history_size}]#{?search_timed_out, (timed out),#{?search_count, (#{search_count}#{?search_count_partial,+,}results),}}"

# Style of position indicator in copy mode
set -g copy-mode-position-style "bg=#{@thm_green},fg=#{@thm_crust}"

# Style of selection in copy mode
set -g copy-mode-selection-style "bg=#{@thm_yellow},fg=#{@thm_crust}"

# Colour of the cursor
set -g cursor-colour "#cdd6f4"

# Style of the cursor
set -g cursor-style block

# Character used to fill unused parts of window
set -g fill-character ""

# Height of the main pane in the "main-horizontal" layout. This may be a percentage, for example "10%"
set -g main-pane-height 24

# Width of the main pane in the "main-vertical" layout. This may be a percentage, for example "10%"
set -g main-pane-width 80

# Type of characters used to draw menu border lines. Some of styles are only supported on terminals with UTF-8 support
set -g menu-border-lines heavy

# Default style of menu borders
set -g menu-border-style "bg=#{@thm_bg},fg=#{@thm_green}"

# Default style of selected menu item
set -g menu-selected-style "bg=#{@thm_yellow},fg=#{@thm_crust}"

# Default style of menu
set -g menu-style "bg=#{@thm_bg},fg=#{@thm_fg}"

# Key set used in copy mode
set -g mode-keys vi

# Style of indicators and highlighting in modes
set -g mode-style "bg=#f9e2af,fg=#11111b"

# Whether an alert is triggered by activity
# NOTE: In some tools like top, fzf, and etc it gonna alert constantly if option is set to on
set -g monitor-activity off

# ==========================================================
# Enables truecolor for apps under tmux
# by adding :RGB to $TERM if it's xterm-256color
set -g terminal-overrides ",xterm-256color:RGB"

# start indexing panes at 1 instead of 0
set -g pane-base-index 1

