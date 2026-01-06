#!/data/data/com.termux/files/usr/bin/env dash

echo "Starting Update..."

pkg update -y
pkg upgrade -y
pkg clean

getnf -U
rm -rf ~/share/

echo "Update is Finished!"
