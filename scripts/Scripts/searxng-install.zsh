#!/bin/zsh
# Simple script to install and setup searxng in termux

pkg update && pkg upgrade -y
pkg install -y git python libxml2 libxslt clang binutils nano curl openssl-tool

rm -rf ~/.local/share/searxng/

git clone 'https://github.com/searxng/searxng' ~/.local/share/searxng/searxng-src/
cd ~/.local/share/searxng/

python -m venv searxng-pyenv
source searxng-pyenv/bin/activate

pip install --upgrade pip setuptools wheel pyyaml pybind11 msgspec typing_extensions

cd ~/.local/share/searxng/searxng-src/

pip install --use-pep517 --no-build-isolation -e .
mkdir -p ~/.config/searxng/

cat << 'EOF' > ~/.local/share/searxng/searxng-src/generate_secret.py
import os, yaml
p=os.path.expanduser("~/.config/searxng/settings.yml")
s=yaml.safe_load(open(p))
s["server"]["secret_key"]=os.urandom(24).hex()
yaml.dump(s, open(p,"w"))
EOF

python ~/.local/share/searxng/searxng-src/generate_secret.py
