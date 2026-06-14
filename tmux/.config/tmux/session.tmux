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
set -gF display-panes-active-colour '#{@thm_accent-color}'

# Color of not active panes in 'display-panes'
set -gF display-panes-colour 'black'

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
set -g message-command-style 'bg=black,fg=yellow'

# Position (line) of messages and the command prompt
set -g message-line 0

# Style of messages and the command prompt
set -g message-style 'bg=default,fg=terminal'

# Whether the mouse is recognised and mouse key bindings are executed
# NOTE: Applications inside panes can use the mouse even when 'off'
set -g mouse on

# The prefix key
set -g prefix C-b

# The second prefix key
# NOTE: In most cases one prefix key is enough
set -g prefix2 none

# Color of the cursor when in the command prompt
set -g prompt-cursor-colour 'default'

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
set -g status-left '#{?client_prefix,#{#[bg=terminal,fg=red]#[bg=red,fg=black,bold]  #{session_name} #[bg=terminal,fg=red]},#{#[bg=terminal,fg=brightblack]#[bg=brightblack,fg=#{@thm_accent-color}]  #{session_name} #[bg=terminal,fg=brightblack}]}'

set -ga status-left '#{?window_zoomed_flag,#{#[bg=default,fg=black]#[bg=black,fg=yellow]  zoom #[bg=default,fg=black]},}'

# NOTE: I use vim-tpipeline plugin for nvim and this line is for it
set -ga status-left '#(cat #{socket_path}-\#{session_id}-vimbridge)'

# Item for 'status-left' which is used as seperator
# set -ga status-left '#[bg=default,fg=black,none]│'

# Maximum width of the left side in the status line
set -g status-left-length 9999

# Main style of the left side in the status line, like background color
set -g status-left-style 'default'

# Position of the status line
set -g status-position top

# Contents of the right side of the status line
# NOTE: I use vim-tpipeline plugin for nvim and my right side of status line has only its parts
set -g status-right '#(cat #{socket_path}-\#{session_id}-vimbridge-R)'

# Maximum width of the right side in the status line
set -g status-right-length 9999

# Style of the right side of the status line
set -g status-right-style 'default'

# Style of the status line, like background color of windows line and etc
set -g status-style 'bg=default,fg=terminal'

# How activity alerts should be shown: a message ('on'), a message and a bell ('both') or nothing ('off')
set -g visual-activity both

# How bell alerts should be shown: a message ('on'), a message and a bell ('both') or nothing ('off')
set -g visual-bell on

# How silence alerts should be shown: a message ('on'), a message and a bell ('both') or nothing ('off')
set -g visual-silence on

# Characters considered to separate words
set -g word-separators "!\"#$%&'()*+,-./:;<=>?@[\]^`{|}~"
