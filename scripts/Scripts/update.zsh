#!/bin/env zsh

print -P '%B%F{#A6E3A1}Starting Update...%f%b'
pkg update -y
pkg upgrade -y
print -P '%B%F{#A6E3A1}Update is finished.b%f%b'

print -P '%B%F{#A6E3A1}Cleaning mess of pkg/apt...%f%b'
pkg autoclean
pkg clean
print -P '%B%F{#A6E3A1}Cleaned mess of pkg/apt.%f%b'

print -P '%B%F{#A6E3A1}Starting update of nerd fonts through getnf...%f%b'
getnf -U
rm -rf ~/share/
print -P '%B%F{#A6E3A1}Fonts are updated.%f%b'

print -P '%F{#B4BEFE}zsh:%f%F{#A6E3A1} update.sh script is succesfully finished.%f'
