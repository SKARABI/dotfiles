#!/bin/bash

sudo easy_install pip

# i3wm bindings for python
pip install i3ipc

# Control MPD
sudo pacman -S --noconfirm mpc

# Control pulseaudio devices
sudo pacman -S --noconfirm pavucontrol

# CLI tool to configure multiple diplays outputs
sudo pacman -S --noconfirm xorg-xrandr

# CLI Tool to control display brightness
sudo pacman -S --noconfirm xorg-xbacklight

# Powerful laucher and window switcher (better than dmenu)
sudo pacman -S --noconfirm rofi

# Tool to set global xconfigs (for xterm for example)
sudo pacman -S --noconfirm xorg-xrdb

# General Dependencies
sudo pacman -S --noconfirm ttf-fira-mono ttf-fira-sans
