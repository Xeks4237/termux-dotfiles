Noting Special to see here

# My dotfiles from termux android

My dotfiles of my android phone because I love to install custom roms on my phone and it's takes time to copy paste configs for tools to make tests

This repo is hosted on [codeberg](https://codeberg.org/Xeks4237/termux-dotfiles) with mirrors of it being on [gitlab](https://gitlab.com/Xeks4237/termux-dotfiles) and [github](https://github.com/Xeks4237/termux-dotfiles)

Also my NeoVim config is the seperate project cold [NV-GOD](https://codeberg.org/Xeks4237/NV-GOD)

# How to add/install dotfiles

⚠️ WARNING: If you want to try my dotfies please recheck everthing begore doing anything, Commands belove can overwrite existing files

Clone dotfiles without NeoVim config using git:

```sh
git clone https://codeberg.org/Xeks4237/termux-dotfiles.git ~/.dotfiles/
```

Clone dotfiles with NeoVim config using git:

```sh
git clone --recurse-submodules https://codeberg.org/Xeks4237/termux-dotfiles.git ~/.dotfiles/
```

Stow everything correctly, expect files for termux itself:

```sh
stow --verbose=2 --adopt --dir=$HOME/.dotfiles/ --target=$HOME --restow bat/ csol/ fzf/ gh/ git/ htop/ lazygit/ nano/ nodejs/ nvim/ pip/ scripts/ searxng/ stow/ thunar/ tmux/ vitetris/ wget/ xfce4/ zsh/
```

Commands to symlink dotfiles for termux, because stow don't allows to do it by security reasons:

```sh
cd ~ && ln -s .dotfiles/termux/.termux/ ~/.termux; ln -s .dotfiles/termux/.config/termux/ ~/.config/termux; ln -s .dotfiles/termux/.termux_authinfo ~/.termux_authinfo
```

# How to apply changes after installing

After stowing everthing first time, everything can be restowed with this command, also it is no difference from where you run this command:

```sh
stow --restow bat/ csol/ fzf/ gh/ git/ htop/ lazygit/ nano/ nodejs/ nvim/ pip/ scripts/ searxng/ stow/ thunar/ tmux/ vitetris/ wget/ xfce4/ zsh/
```
