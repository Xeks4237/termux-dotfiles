#!/usr/bin/zsh
# Simple script to update system and stuff in one command

print -P '%F{green}Updating Termux%f'
pkg update -y
pkg upgrade -y

print -P '%F{green}Updating nerd fonts%f'
getnf -U

print -P '%F{cyan}Cleaning%f'
rm -rf ~/share/
pkg autoclean
pkg clean
