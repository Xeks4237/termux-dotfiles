Noting Special to see here

# My dotfiles from termux android

though to post it on [gitlab](https://gitlab.com/Xeks4237/termux-dotfiles) and [github](https://github.com/Xeks4237/termux-dotfiles) because I love to install custom roms for my phone and it's takes time to copy paste configs for tools to make tests

Also I don't included here my NeoVim config because it's in seperate repo cold NV-GOD on [gitlab](https://gitlab.com/Xeks4237/NV-GOD) and [github](https://github.com/Xeks4237/NV-GOD)

WARNING: commands belove can overwrite existing files, please recheck before continuing.

To use dotfiles:

Clone dotfiles using git:

```sh
git clone https://gitlab.com/Xeks4237/termux-dotfiles.git
```

Stow config for stow self:

```sh
stow --verbose=2 --adopt --dir=$HOME/.dotfiles/ --target=$HOME stow
```

Stow everything else:

```sh
stow csol git htop lazygit nano nodejs nvim pip scripts stow thunar tmux vitetris wget xfce4 zsh
```

Commands to symlink dotfiles for termux, because stow don't allows to do it:

```sh
cd ~/ && rm -r ~/.termux/
```

```sh
cd ~/ && ln -is ~/.dotfiles/termux/.termux/ ~/.termux
```

```sh
cd ~/ && ln -is ~/.dotfiles/termux/.config/termux/ ~/.config/termux
```

```sh
cd ~/ && ln -is ~/.dotfiles/termux/.termux_authinfo ~/.termux_authinfo
```
