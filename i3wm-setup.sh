#!/bin/bash

# General Dependencies
sudo yaourt -S --noconfirm ttf-fira-mono ttf-fira-sans \
  urxvt-perls rxvt-unicode \
  scrot zathura zathura-pdf-mupdf zathura-ps zathura-djvu \
  python-pip mpd mpc ncmpcpp pavucontrol amixer \
  xorg-xrandr xorg-xbacklight xorg-xrdb \
  ranger w3m udiskie

sudo pip install i3ipc
