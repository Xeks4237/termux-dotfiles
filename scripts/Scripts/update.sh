#!/data/data/com.termux/files/usr/bin/bash

echo "Starting Update..."

pkg update -y
pkg upgrade -y
pkg clean

getnf -U
rm -rf ~/share/

echo "Update is Finished!"
