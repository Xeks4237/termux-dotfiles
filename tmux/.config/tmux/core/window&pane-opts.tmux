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

# Whether an alert is triggered by a bell
set -g monitor-bell off

# Time after which an alert is triggered by silence. Zero means no alert
# NOTE: it can be usefull to keep your device awake, but why? idk
set -g monitor-silence 0

# Height of the other panes in the "main-horizontal" layout. This may be a percentage, for example "10%"
set -g other-pane-height 0

# Height of the other panes in the 'main-vertical" layout. This may be a percentage, for example "10%"
set -g other-pane-width 0

# Style of the active pane border
set -g pane-active-border-style "#{?pane_in_mode,fg=#{@thm_yellow},#{?synchronize-panes,fg=#{@thm_lavender},fg=#{@thm_green}}}"

# Index of the first pane in each window
set -g pane-base-index 1

# Format of text in the pane status lines
set -g pane-border-format "#{?pane_active, Pane #{pane_index} ,#{ Pane #{pane_index}: #{pane_current_command} }}"

# Whether to indicate border of active pane by colouring or displaying arrow markers
# NOTE: Is tmux devs are British? like why "colour" instead of "color"?
set -g pane-border-indicators colour

# Type of characters used to draw pane border lines. Some of these are only supported on terminals with UTF-8 support
set -g pane-border-lines heavy

# Position of the pane status lines
set -g pane-border-status top

# Style of the pane status line
# NOTE: This option changes style of non active border lines
set -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"

# Pane scrollbars state
# NOTE: "modal" value makes scrollbars to appear only when needed
set -g pane-scrollbars modal

# Pane scrollbars position
set -g pane-scrollbars-position right

# Style of the pane scrollbar
set -g pane-scrollbars-style "bg=#6c7086,fg=#cdd6f4,width=1,pad=0"

# Style of the current pane in the status line
set -g pane-status-current-style "bg=#{@thm_bg},fg=#{@thm_green}"

# Style of panes in the status line, except the current pane
set -g pane-status-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"

# Type of characters used to draw popup border lines. Some of these are only supported on terminals with UTF-8 support
set -g popup-border-lines heavy

# Default style of popup borders
set -g popup-border-style "bg=#{@thm_bg},fg=#{@thm_green}"

# Default style of popups
set -g popup-style "bg=#{@thm_bg},fg=#{@thm_fg}"

# Whether panes should remain ("on") or be automatically killed ("off" or "failed") when the program inside exits
set -g remain-on-exit failed

# Message shown after the program in a pane has exited, if remain-on-exit is enabled
set -g remain-on-exit-format "#{pane_current_command} in Pane #{pane_index} Failed"

# Whether the contents of the screen should be scrolled into history when clearing the whole screen
set -g scroll-on-clear on

# Style of the current session in the status line
set -g session-status-current-style "bg=#{@thm_green},fg=#{@thm_crust}"

# Style of sessions in the status line, except the current session
set -g session-status-style "bg=#{@thm_bg},fg=#{@thm_green}"

# ==========================================================
# Enables truecolor for apps under tmux
# by adding :RGB to $TERM if it's xterm-256color
set -g terminal-overrides ",xterm-256color:RGB"

