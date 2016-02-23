#!/bin/bash

sudo easy_install pip

# i3wm bindings for python
pip install i3ipc

sudo yaourt -S i3-gaps-git i3lock i3blocks dunst-git compton feh imagemagick

# Music Player Daemon
sudo pacman -S --noconfirm mpd mpc

# Control pulseaudio devices
sudo pacman -S --noconfirm pavucontrol amixer

# CLI tool to configure multiple diplays outputs
sudo pacman -S --noconfirm xorg-xrandr

# CLI Tool to control display brightness
sudo pacman -S --noconfirm xorg-xbacklight

# CLI Tool to control keyboardbrightness
sudo yourt -S --noconfirm kbdlight

# Powerful laucher and window switcher (better than dmenu)
sudo pacman -S --noconfirm rofi

# Tool to set global xconfigs (for xterm, rofi, urxvt, etc)
sudo pacman -S --noconfirm xorg-xrdb

# Automount devices (automatically started with my i3 config)
sudo pacman -S --noconfirm udiskie

# CLI file manager
sudo pacman -S --noconfirm ranger w3m

# General Dependencies
sudo pacman -S --noconfirm ttf-fira-mono ttf-fira-sans \
  urxvt-perls rxvt-unicode \
  scrot zathura zathura-pdf-mupdf zathura-ps zathura-djvu
