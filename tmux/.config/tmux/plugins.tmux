# [ Tmux Plugin Manager ]
# Update all outdated plugins
bind-key -T prefix U run '#{d:current_file}/plugins/tpm-async/bindings/update_plugins'

# Resource tmux config and install new plugins if availible
bind-key -T prefix I run '#{d:current_file}/plugins/tpm-async/bindings/install_plugins'

# Clean plugins which are removed from config
bind-key -T prefix O run '#{d:current_file}/plugins/tpm-async/bindings/clean_plugins'
