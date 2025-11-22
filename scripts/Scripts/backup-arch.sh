#!/usr/bin/bash

# simple script to backup archlinux-arm in to tarball

echo "Enabling termux-wake-lock"
termux-wake-lock

echo "Starting Backup..."
proot-distro backup archlinux-arm --output \
  ~/storage/downloads/archlinux-arm_backup.gz

echo "Backup was completed, Disabling termux-wake-lock..."
termux-wake-unlock
