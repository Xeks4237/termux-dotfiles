# [ Tmux Plugin Manager ]
# Update all outdated plugins
bind-key -T prefix U run-shell $XDG_CONFIG_HOME/tmux/plugins/tpm/bindings/update_plugins

# Resource tmux config and install new plugins if availible
bind-key -T prefix I run-shell $XDG_CONFIG_HOME/tmux/plugins/tpm/bindings/install_plugins

# Clean plugins which are removed from config
bind-key -T prefix O run-shell $XDG_CONFIG_HOME/tmux/plugins/tpm/bindings/clean_plugins

