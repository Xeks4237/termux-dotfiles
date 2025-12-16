# [ Session Options ]
# Action to take on an activity alert
set -g activity-action other

# Maximum time between input to assume it is pasting rather than typing
set -g assume-paste-time 1

# Default index of the first window in each session
set -g base-index 1

# Action to take on a bell alert
set -g bell-action any

# Default command to run in new panes. If empty, default shell is started
set -g default-command "zsh"

# Location of default shell
set -g default-shell "$SHELL"

# Initial size of new sessions
set -g default-size "80x24"

# Whether to destroy sessions when they have no attached clients
set -g destroy-unattached off

# Whether to detach when a session is destroyed
# Or switch the client to another session if any exist
set -g detach-on-destroy on

# Color of the active pane in "display-panes" menu
set -g display-panes-active-colour "red"

# Color of not active panes in "display-panes" menu
set -g display-panes-colour "blue"

# Time in which "display-panes" menu should show pane numbers
set -g display-panes-time 500

# Time in which status line messages should appear
set -g display-time 500

# Maximum number of lines to keep in the history for each pane
set -g history-limit 10000

# Time to wait for a key binding to repeat the first time the key is pressed
set -g initial-repeat-time 0

# Default key table
# NOTE: Key presses are first looked up in this table if-T is not specified for bindkey
set -g key-table "root"

# Time after which client is locked if not used
set -g lock-after-time 0

# Shell command to run to lock a client
set -g lock-command "lock -np"

# Style of the command prompt when in command mode, if "mode-keys" is set  to "vi"
set -g message-command-style "bg=#{@thm_surface_0},fg=#{@thm_yellow}"

# Position (line) of messages and the command prompt
set -g message-line 0

# Style of messages and the command prompt
set -g message-style "bg=#{@thm_bg},fg=#{@thm_fg}"

# Whether the mouse is recognised and mouse key bindings are executed
# NOTE: Applications inside panes can use the mouse even when "off"
set -g mouse on

# The prefix key
set -g prefix C-Space

# The second prefix key
# NOTE: in most cases one prefix key is enough
set -g prefix2 none

# Colour of the cursor when in the command prompt
set -g prompt-cursor-colour "#cdd6f4"

# Style of the cursor when it's in the command prompt
set -g prompt-cursor-style "block"

# Whether windows are automatically renumbered rather than leaving gaps
set -g renumber-windows on

# Time to wait for a key binding to repeat, if it is bound with the "-r" flag
set -g repeat-time 500

# Whether to set the terminal title, if supported
set -g set-titles on

# Format of the terminal title to set
set -g set-titles-string '#S:#I:#W - "#T" #{session_alerts}'

# Action to take on a silence alert
set -g silence-action other

# Number of lines in the status line
# NOTE: "on" means 1 line
set -g status on

# WARN: This option is deprecated, use "status-style" instead
# set -g status-bg "default"

# WARN: This option is deprecated, use "status-style" instead
# set -g status-fg "default"

# Number of seconds between status line updates
set -g status-interval 1

# Alighment/Position of the windows list in the status line
set -g status-justify left

# Key set to use at the command prompt
set -g status-keys vi

# Contents of the left side of the status line
# NOTE: This option is used here multiple times for management purposes
# And also there are used "-a" flag to ADD extra options instead of over writing
# First set status line to be empty
set -g status-left ""

# Item for "status-left" which shows current session name
# And changes color when prefix key is pressed/active
set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"

# Item for "status-left" which is used as seperator
set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"

# Maximum width of the left side in the status line
set -g status-left-length 100

# Main style of the left side in the status line, like background color
set -g status-left-style "default"

# Position of the status line
set -g status-position top

# Contents of the right side of the status line
# NOTE: This option is used here multiple times for management purposes
# And also there are used "-a" flag to ADD extra options instead of over writing
# First set status line to be empty
set -g status-right ""

# Item for "status-right" which appears only when some pane is zoomed/fullscreened and its used as seperator, 
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"

# Item for "status-right" which appears only when some pane is zoomed/fullscreened
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

# Item for "status-right" which appears only when some pane is zoomed/fullscreened and its used as seperator, 
set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"

set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_sky}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "

# Maximum width of the right side in the status line
set -g status-right-length 100

# ==========================================================
# Enables truecolor for apps under tmux
# by adding :RGB to $TERM if it's xterm-256color
set -g terminal-overrides ",xterm-256color:RGB"

# start indexing panes at 1 instead of 0
set -g pane-base-index 1

# Super useful when using "grouped sessions" and multi-monitor setup
set -g aggressive-resize on

