# [ Server Options ]
# The key to send for backspace
set -g backspace C-?

# The maximum number of automatic buffers
# When this is reached, the oldest buffer is deleted
set -g buffer-limit 100

# Array of override widths for Unicode codepoints
# INFO: Allows special unicode characters to have different width on screen
# set -g codepoint-widths[]

# Array of command aliases. Each entry is an alias and a command separated by '='
# NOTE: Commented ones are defaults which I don't use
# set -g command-alias[0] 'split-pane=split-window'
# set -g command-alias[1] 'splitp=split-window'
# set -g command-alias[2] 'server-info=show-messages -JT'
# set -g command-alias[3] 'info=show-messages -JT'
# set -g command-alias[4] 'choose-window=choose-tree -w'
# set -g command-alias[5] 'choose-session=choose-tree -s'

# Shell command run when text is copied. If empty, no command is run.
set -g copy-command ''

# Default subcommand to run when tmux is run without one
set -g default-client-command 'attach'

# Set default terminal term option using $TERM variable
set -g default-terminal "$TERM"

# Set default editor to use for editing files, using $EDITOR variable
set -g editor "$EDITOR"

# Time to wait before assuming a key is Escape
set -g escape-time 0

# Whether the server of tmux should exit if there are no sessions
set -g exit-empty off

# Whether the server should exit if there are no attached clients
set -g exit-unattached off

# Whether to request extended key sequences from terminals that support it
set -g extended-keys on

# The format of emitted extended key sequences
set -g extended-keys-format xterm

# Whether to send focus events to applications
set -g focus-events on

# Location of the command prompt history file
# NOTE: If left empty then don't writes history file
set -g history-file ''

# Number of bytes accepted in a single input before dropping buffer
set -g input-buffer-size 1048576 

# Maximum number of server messages to keep.
set -g message-limit 1000

# The timeout for the prefix key if no subsequent key is pressed
set -g prefix-timeout 0

# Maximum number of commands to keep in history
set -g prompt-history-limit 100

# Use system clipboard
set -g set-clipboard on

# List of terminal features, used if they can not be automatically detected
set -g terminal-features[0] 'xterm*:clipboard:ccolour:cstyle:focus:title'
set -g terminal-features[1] 'screen*:title'
set -g terminal-features[2] 'rxvt*:ignorefkeys'

# terminal-overrides is a List of terminal capabilities overrides
# NOTE: This enables truecolor for tmux
set -g terminal-overrides[0] 'xterm-256color:RGB'

# User key assignments. Each sequence in the list is translated into a key: 'User0', 'User1' and so on
# set -g user-keys[]

# If the Unicode VS16 codepoint should always be treated as a wide character
set -g variation-selector-always-wide on

# [ Session Options ]
# Action to take on an activity alert
set -g activity-action other

# Maximum time between input to assume it is pasting rather than typing
# NOTE: 1 means 1 millisecond
set -g assume-paste-time 1

# Default index of the first window in each session
set -g base-index 1

# Action to take on a bell alert
set -g bell-action any

# Default command to run in new panes. If empty, default shell is started
set -g default-command 'zsh'

# Location of default shell
set -g default-shell "$SHELL"

# Initial size of new sessions
set -g default-size '77x36'

# Whether to destroy sessions when they have no attached clients
set -g destroy-unattached off

# Whether to detach when a session is destroyed
# Or switch the client to another session if any exist
set -g detach-on-destroy off

# Color of the active pane in 'display-panes'
set -g display-panes-active-colour 'green'

# Color of not active panes in 'display-panes'
set -g display-panes-colour 'green'

# Time in which 'display-panes' menu should show pane numbers
set -g display-panes-time 1000

# Time in which status line messages should appear
set -g display-time 500

# Maximum number of lines to keep in the history for each pane
set -g history-limit 10000

# Time to wait for a key binding to repeat the first time the key is pressed
set -g initial-repeat-time 0

# Default key table, Key presses are first looked up in this table
set -g key-table root

# Time in seconds after which client is locked if not used
set -g lock-after-time 0

# Shell command to run to lock a client
set -g lock-command 'lock -np'

# Style of the command prompt when in command mode, If 'mode-keys' is set  to 'vi'
set -g message-command-style 'bg=#{@thm_surface_0},fg=#{@thm_yellow}'

# Position (line) of messages and the command prompt
set -g message-line 0

# Style of messages and the command prompt
set -g message-style 'bg=#{@thm_bg},fg=#{@thm_fg}'

# Whether the mouse is recognised and mouse key bindings are executed
# NOTE: Applications inside panes can use the mouse even when 'off'
set -g mouse off

# The prefix key
set -g prefix C-b

# The second prefix key
# NOTE: In most cases one prefix key is enough
set -g prefix2 none

# Color of the cursor when in the command prompt
set -g prompt-cursor-colour '#cdd6f4'

# Style of the cursor when it's in the command prompt
set -g prompt-cursor-style block

# Whether windows are automatically renumbered rather than leaving gaps
set -g renumber-windows on

# Time to wait for a key binding to repeat, if it is bound with the '-r' flag
set -g repeat-time 500

# Whether to set the terminal title, if supported
set -g set-titles on

# Format of the terminal title to set
set -g set-titles-string '#S: #W - #T #{session_alerts}'

# Action to take on a silence alert
set -g silence-action other

# Number of lines in the status line
# NOTE: 'on' means 1 line
set -g status on

# WARN: This option is deprecated, use 'status-style' instead
# set -g status-bg 'default'

# WARN: This option is deprecated, use 'status-style' instead
# set -g status-fg 'default'

# Number of seconds between status line updates
set -g status-interval 1

# This option sets alighment/position of the windows list in the status line
set -g status-justify left

# Key set to use at the command prompt
set -g status-keys vi

# Contents of the left side of the status line
set -g status-left '#{?client_prefix,#{#[#{bg=#{@thm_bg},fg=#{@thm_red}}]#[bg=#{@thm_red},fg=#{@thm_crust},bold]  #{session_name} #[bg=#{@thm_bg},fg=#{@thm_red}]},#{#[#{bg=#{@thm_bg},fg=#{@thm_surface_0}}]#[bg=#{@thm_surface_0},fg=#{@thm_green}]  #{session_name} #[bg=#{@thm_bg},fg=#{@thm_surface_0}}]}'

set -ga status-left '#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,#{#[bg=#{@thm_bg},fg=#{@thm_surface_0}]#[bg=#{@thm_surface_0},fg=#{@thm_yellow}]  zoom #[bg=#{@thm_bg},fg=#{@thm_surface_0}]},}'

set -ga status-left '#(cat #{socket_path}-\#{session_id}-vimbridge)'

# Item for 'status-left' which is used as seperator
# set -ga status-left '#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│'

# Maximum width of the left side in the status line
set -g status-left-length 9999

# Main style of the left side in the status line, like background color
set -g status-left-style 'default'

# Position of the status line
set -g status-position top

# Contents of the right side of the status line
set -g status-right '#(cat #{socket_path}-\#{session_id}-vimbridge-R)'

# Maximum width of the right side in the status line
set -g status-right-length 9999

# Style of the right side of the status line
set -g status-right-style 'default'

# Style of the status line, like background color of windows line and etc
set -g status-style 'bg=#{@thm_bg},fg=#{@thm_fg}'

# How activity alerts should be shown: a message ('on'), a message and a bell ('both') or nothing ('off')
set -g visual-activity both

# How bell alerts should be shown: a message ('on'), a message and a bell ('both') or nothing ('off')
set -g visual-bell on

# How silence alerts should be shown: a message ('on'), a message and a bell ('both') or nothing ('off')
set -g visual-silence on

# Characters considered to separate words
set -g word-separators "!\"#$%&'()*+,-./:;<=>?@[\]^`{|}~"

# [ Window & Pane Options ]
# When 'window-size' is 'smallest', whether the maximum size of a window is the smallest attached session where it is the current window ('on') or the smallest session it is linked to ('off')
# NOTE: Super useful when using 'grouped sessions' and multi-monitor setup
set -g aggressive-resize on

# Whether applications are allowed to use the escape sequence to bypass tmux
# Can be 'off' (disallowed), 'on' (allowed if the pane is visible), or 'all' (allowed even if the pane is invisible)
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
# set -g automatic-rename-format ''

# Color of the clock in clock mode
set -g clock-mode-colour '#a6e3a1'

# Time format of the clock in clock mode
set -g clock-mode-style 24-with-seconds

# Style of the current search match in copy mode
set -g copy-mode-current-match-style 'bg=#{@thm_red},fg=#{@thm_crust}'

# Style of the marked line in copy mode
set -g copy-mode-mark-style 'bg=#{@thm_red},fg=#{@thm_crust}'

# Style of search matches in copy mode
set -g copy-mode-match-style 'bg=#{@thm_sky},fg=#{@thm_crust}'

# Format of the position indicator in copy mode
# TODO: Gonna configure this option to have custom look with better info on it than default later...
# set -g copy-mode-position-format '#[align=right]#{t/p:top_line_time}#{?#{e|>:#{top_line_time},0},,}[#{scroll_position}/#{history_size}]#{?search_timed_out, (timed out),#{?search_count, (#{search_count}#{?search_count_partial,+,}results),}}'

# Style of position indicator in copy mode
set -g copy-mode-position-style 'bg=#{@thm_green},fg=#{@thm_crust}'

# Style of selection in copy mode
set -g copy-mode-selection-style 'bg=#{@thm_overlay_0},fg=#{@thm_fg}'

# Color of the cursor
set -g cursor-colour '#cdd6f4'

# Style of the cursor
set -g cursor-style block

# Character used to fill unused parts of window
set -g fill-character ''

# Height of the main pane in the 'main-horizontal' layout. This may be a percentage, for example '10%'
set -g main-pane-height 24

# Width of the main pane in the 'main-vertical' layout. This may be a percentage, for example '10%'
set -g main-pane-width 80

# Type of characters used to draw menu border lines. Some of styles are only supported on terminals with UTF-8 support
set -g menu-border-lines heavy

# Default style of menu borders
set -g menu-border-style 'bg=#{@thm_bg},fg=#{@thm_green}'

# Default style of selected menu item
set -g menu-selected-style 'bg=#{@thm_yellow},fg=#{@thm_crust}'

# Default style of menu
set -g menu-style 'bg=#{@thm_bg},fg=#{@thm_fg}'

# Key set used in copy mode
set -g mode-keys vi

# Style of indicators and highlighting in modes
set -g mode-style "bg=#{@thm_yellow},fg=#{@thm_bg}"

# Whether an alert is triggered by activity
# NOTE: In some tools like top, fzf, and etc it gonna alert constantly if option is set to on
set -g monitor-activity off

# Whether an alert is triggered by a bell
set -g monitor-bell off

# Time after which an alert is triggered by silence. Zero means no alert
# NOTE: it can be useful to keep your device awake, but why? idk
set -g monitor-silence 0

# Height of the other panes in the 'main-horizontal' layout. This may be a percentage, for example '10%'
set -g other-pane-height 0

# Height of the other panes in the 'main-vertical' layout. This may be a percentage, for example '10%'
set -g other-pane-width 0

# Style of the active pane border
set -g pane-active-border-style 'bg=#{@thm_bg},fg=#{?pane_in_mod>e,#{@thm_yellow},#{?synchronize-panes,#{@thm_lavender},#{@thm_green}}}'

# Index of the first pane in each window
set -g pane-base-index 1

# Format of text in the pane's border lines
set -g pane-border-format '#{?pane_active,#{#[align=absolute-centre,bg=#{@thm_green},fg=#{@thm_bg},bold] Pane #{pane_index} },#{#[align=absolute-centre,bg=#{@thm_overlay_0},fg=#{@thm_fg},bold] Pane #{pane_index}: #{pane_current_command} }}'

# Whether to indicate border of active pane by coloring or displaying arrow markers
# NOTE: Are tmux devs British? like why 'colour' instead of 'color'?
set -g pane-border-indicators colour

# Type of characters used to draw pane border lines. Some of these are only supported on terminals with UTF-8 support
set -g pane-border-lines heavy

# Position of the pane status lines
set -g pane-border-status top

# Style of the pane status line
# NOTE: This option changes style of non active border lines
set -g pane-border-style 'bg=#{@thm_bg},fg=#{@thm_overlay_0}'

# Pane scrollbars state
# NOTE: 'modal' value makes scrollbars to appear only when needed
set -g pane-scrollbars off

# Pane scrollbars position
set -g pane-scrollbars-position right

# Style of the pane scrollbar
set -g pane-scrollbars-style 'bg=#6C7086,fg=#CDD6F4,width=1,pad=0'

# Style of the current pane in the status line
set -g pane-status-current-style 'bg=#{@thm_bg},fg=#{@thm_green}'

# Style of panes in the status line, except the current pane
set -g pane-status-style 'bg=#{@thm_bg},fg=#{@thm_overlay_0}'

# Type of characters used to draw popup border lines.
# NOTE: Some of these are only supported on terminals with UTF-8 support
set -g popup-border-lines heavy

# Default style of popup borders
set -g popup-border-style 'bg=#{@thm_bg},fg=#{@thm_green}'

# Default style of popups
set -g popup-style 'bg=#{@thm_bg},fg=#{@thm_fg}'

# Whether panes should remain ('on') or be automatically killed ('off' or 'failed') when the program inside exits
set -g remain-on-exit off

# Message shown after the program in a pane has exited, if remain-on-exit is enabled
set -g remain-on-exit-format '#{pane_current_command} in Pane #{pane_index} Failed'

# Whether the contents of the screen should be scrolled into history when clearing the whole screen
set -g scroll-on-clear on

# Style of the current session in the status line
set -g session-status-current-style 'bg=#{@thm_green},fg=#{@thm_crust}'

# Style of sessions in the status line, except the current session
set -g session-status-style 'bg=#{@thm_bg},fg=#{@thm_green}'

# Whether typing should be sent to all panes simultaneously
# NOTE: This option is supposed to be used in keymaps for toggling synchronize panes separately
# And here I set up that they are turned of on STARTUP
set -g synchronize-panes off

# Maximum number of columns in the 'tiled' layout. A value of 0 means no limit
set -g tiled-layout-max-columns 0

# Default style of the active pane
set -g window-active-style 'bg=default,fg=default'

# How window size is calculated. 'latest' uses the size of the most recently used client, 'largest' the largest client, 'smallest' the smallest client and 'manual' a size set by the 'resize-window' command
set -g window-size latest

# Style of windows in the status line with an activity alert
set -g window-status-activity-style 'bg=#{@thm_red},fg=#{@thm_bg}'

# Style of windows in the status line with a bell alert
set -g window-status-bell-style 'bg=#{@thm_red},fg=#{@thm_bg}'

# Format of the current window in the status line
set -g window-status-current-format '#[bg=#{@thm_bg},fg=#{@thm_green}]#[bg=#{@thm_green},fg=#{@thm_crust}] #{window_index}: #{window_icon}#{window_name}#{?window_flags, #{window_flags},}#[bg=#{@thm_bg},fg=#{@thm_green}]█'

# Style of the current window in the status line
set -g window-status-current-style 'bold'

# Format of windows in the status line, except the current window
set -g window-status-format '#[bg=#{@thm_bg},fg=#{@thm_surface_1}]#[bg=#{@thm_surface_1},fg=#{@thm_green}] #{window_index}: #{window_icon}#{window_name}#{?window_flags, #{window_flags},}#[bg=#{@thm_bg},fg=#{@thm_surface_1}]█'

# Style of the last window in the status line
set -g window-status-last-style ''

# Separator between windows in the status line
set -g window-status-separator ''

# Style of windows in the status line, except the current and last windows
set -g window-status-style 'bg=#{@thm_surface_0},fg=#{@thm_green}'

# Default style of panes that aren't the active pane
set -g window-style 'bg=default,fg=default'

# Whether searching in copy mode should wrap at the top or bottom
set -g wrap-search on

# Whether xterm-style function key sequences should be sent. This option is no longer used but good to be set
set -g xterm-keys on
