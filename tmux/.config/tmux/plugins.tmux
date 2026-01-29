# [ Tmux Plugin Manager ]
# Update all outdated plugins
bind-key -T prefix U run-shell ~/.config/tmux/plugins/tpm/bindings/update_plugins

# Resource tmux config and install new plugins if availible
bind-key -T prefix I run-shell ~/.config/tmux/plugins/tpm/bindings/install_plugins

# Clean plugins which are removed from config
bind-key -T prefix O run-shell ~/.config/tmux/plugins/tpm/bindings/clean_plugins

# [ Smooth scrolling plugin ]
# Speed: 0-1000 | lower = faster
set -g @smooth-scroll-speed 80

# Enable on mouse wheel scroll
set -g @smooth-scroll-mouse "true"

# Easing mode: linear, sine, quad
set -g @smooth-scroll-easing "sine"

# Scroll line distance
set -g @smooth-scroll-normal 2

# Default: pane_height / 2
set -g @smooth-scroll-halfpage ""

# Default: pane_height
set -g @smooth-scroll-fullpage ""

