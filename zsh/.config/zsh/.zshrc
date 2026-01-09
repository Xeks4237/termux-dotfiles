# [ Environment Variables ]
# Environment variables are set in .zshenv

# [ Zinit plugin manager ]
source ${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/extra/zinit.zsh

# [ Etc little pieces of code ]
source ${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/extra/etc.zsh

# [ Keymaps ]
source ${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/extra/keymaps.zsh

# [ Aliases ]
source ${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/extra/aliases.zsh

# [ Prompt ]
source ${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/extra/prompt.zsh

# [ Variables for Zsh/Zinit plugins ]
# zsh-vi-mode: Editor which is used when editing current command in editor
ZVM_VI_EDITOR=${EDITOR:-$VISUAL}

# zsh-vi-mode: Enables system clipboard support for zsh-vi-mode plugin
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# zsh-vi-mode: What commant plugin uses to send text to system clipboard
ZVM_CLIPBOARD_COPY_CMD="termux-clipboard-set"

# zsh-vi-mode: What commant plugin uses to get text from system clipboard
ZVM_CLIPBOARD_PASTE_CMD="termux-clipboard-get"

