# [ Server Options ]
# The maximum number of automatic buffers
set -g buffer-limit 100

# Default command to run when tmux is run without a command
set -g default-client-command "new-session"

# Set default-terminal option using $TERM variable
set -g default-terminal "${TERM}"

# Set default editor to use for editing files
set -g editor "$PREFIX/bin/nvim"

# Time to wait before assuming a key is Escape
set -g escape-time 0

# Whether the server should exit if there are no sessions
set -g exit-empty on

# Whether the server should exit if there are no attached clients
set -g exit-unattached off

# Whether to request extended key sequences from terminals that support it
set -g extended-keys on

# The format of emitted extended key sequences
set -g extended-keys-format "xterm"

# Whether to send focus events to applications
set -g focus-events on

# Location of the command prompt history file
# NOTE: If left empty then don't writes history file
set -g history-file "~/.config/tmux/command-history"

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

# If the Unicode VS16 codepoint should always be treated as a wide character
set -g variation-selector-always-wide on

