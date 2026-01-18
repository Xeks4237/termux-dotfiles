#!/usr/bin/env zsh
# NOTE: Shebang line isn't needed here, But I anyway added it for fun

# Order in which zsh sources its config files: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# This file is sources by login shell instance(s) of zsh
# Its not the case if instance of zsh was runned through '/usr/bin/sh' symlink
# because then zsh runns in POSIX compilant 'Bourne Shell' like mode where it doesn't sources this file
# This file was ment to be used as alternative to '.login' file for 'ksh' users.
# INFO: For more about zsh see 'zshall' mandoc page

# NOTE: I RECOMMEND YOU TO DON'T USE THIS FILE.
# Put everything to '.zprofile' file instead of this file
# '.zprofile' is more convenient, consistent, reliable, and better overall.


