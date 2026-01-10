# Simple explanation of Zsh config files

Zsh loads files in special order, first it loads these files from /etc or /etc/zsh directories depending on which distro are you using:
zshenv → zprofile → zshrc → zlogin → zlogout

Then it looks and loads these files from $HOME or if its set then from $ZDOTDIR directories:
.zshenv → .zprofile → .zshrc → .zlogin → .zlogout

All files located under /etc or /etc/zsh are sourced system wide for every user while files located under $HOME or $ZDOTDIR are user specific and sourced for each users $HOME and $ZDOTDIR separately.

All of the files mentioned above are using zsh syntax and all of them gets sourced as zsh scripts, This means you can put some logical elements in them like conditions, loops, functions, and etc.

Each of the files are gettings sourced in the order mentioned above by every instance of zsh but some of them are sourced only in some exact cases/scenarios described below.

1. zshenv and .zshenv files are sourced/runned/loaded in every instance of zsh, starting with login shell and ending with scripts pointing to zsh with shebang line,
   The only exception when zsh ignores this file is when its gets called through '/usr/bin/sh' symlink, because 'sh' used here should be POSIX compatible 'Bourne Shell' described in POSIX book, So when zsh gets called through this way it runs itself in POSIX compatible mode without any fancy zsh stuff

2. zprofile and .zprofile files are sourced/runned/loaded for instance of zsh which is a 'login shell', This instance of zsh gets called when you open your terminal or turn on your pc without UI/desktop, also you can give -l or --login flag to zsh to make it behave as login shell, This file is the same as zlogin or .zlogin, but zlogin and .zlogin are called after zshrc while zprofile and .zprofile gets called before. This file is mainly needed to set up stuff which gets sourced/called by zsh only one time before opening terminal.

3. zshrc and .zshrc files are sourced/runned/loaded for instances of zsh which are launched as 'interactive shell', 'interactive' instances of zsh are the ones where you can type commands and get output from them, this file most commonly has user defined aliases, options, and etc.

4. zlogin and .zlogin files are the same as zprofile and .zprofile but in difference to them zlogin and .zlogin are sourced after zshrc and .zshrc files, these files are mostly contain some commands to auto start desktop environment on login but because init systems as systemd or openrc can run desktop environment on boot of device by themselfes this file file isn't that usefull, and also these files were mostly ment to be used by ksh users as alternative to .login file, so you can ignore it. Cases and order of when this file gets sourced makes this file meaningles.

5. zlogout and .zlogout files are sourced after 'login shell' instance of zsh exits/closes, it mostly ment for some stuff like clearing cache/tmp files, displaying good bye message before zsh exits, and etc. These files are mostly made for 'quality of life' features.
