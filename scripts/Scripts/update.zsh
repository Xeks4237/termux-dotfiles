#!/bin/zsh

print -P '%B%F{#A6E3A1}Starting Update...%f%b'
pkg update -y
pkg upgrade -y
pkg autoclean
pkg clean
getnf -U
rm -rf ~/share/

print -P '%F{#B4BEFE}zsh:%f%F{#A6E3A1} update.zsh script is succesfully finished.%f'
