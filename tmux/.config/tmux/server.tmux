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
