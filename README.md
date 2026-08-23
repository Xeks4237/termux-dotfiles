Noting Special to see here

# My dotfiles from termux android

My dotfiles of my android phone because I love to install custom roms on my phone and it's takes time to copy paste configs for tools to make tests

This repo is hosted on [codeberg](https://codeberg.org/xeks4237/dotfiles) with read and write mirror of it on [github](https://github.com/xeks4237/dotfiles)

# How to add/install dotfiles

⚠️ WARNING: If you want to try my dotfies please recheck everthing begore doing anything, Commands belove can overwrite existing files

Clone dotfiles using git:

```sh
git clone https://codeberg.org/xeks4237/dotfiles.git ~/.dotfiles/
```

Stow everything correctly, expect files for termux itself:

```sh
stow --verbose=2 --adopt --dir=$HOME/.dotfiles/ --target=$HOME --restow asciinema/ bat/ gh/ git/ htop/ lazygit/ nvim/ pip/ scripts/ stow/ tmux/ tv/ wget/ zsh/
```

Commands to symlink dotfiles for termux, because stow don't allows to do it by security reasons:

```sh
cd ~ && ln -s .dotfiles/termux/.termux/ ~/.termux; ln -s ../.dotfiles/termux/.config/termux/ ~/.config/termux; ln -s .dotfiles/termux/.termux_authinfo ~/.termux_authinfo
```

# How to apply changes after installing

After stowing everthing first time, everything can be restowed with this command, also it is no difference from where you run this command:

```sh
stow --restow asciinema/ bat/ gh/ git/ htop/ lazygit/ nvim/ pip/ scripts/ stow/ tmux/ tv/ wget/ zsh/
```
