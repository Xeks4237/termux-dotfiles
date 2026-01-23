#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources by login shell instance(s) of zsh before exitind, for example after closing terminal.
# Its not the case if instance of zsh was runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file
# This file was ment to be used as alternative to '.login' file for 'ksh' users.
# INFO: For more about zsh see 'zshall' mandoc page

# NOTE: So you can put here some stuff like:
# Commands to clear cache/tmp, display goodbye message, close some additional stuff and etc.

# Goodbye message
print -Pr "%F{$prompt_thm_green}$(figlet -kcfslant '>:3')%f"

