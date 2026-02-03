#!/usr/bin/env sh

echo "Starting Update..."

pkg update -y
pkg upgrade -y

pkg autoclean
pkg clean

getnf -U
rm -rf ~/share/

echo "Update is Finished!"
