sudo pacman -S --noconfirm acpi tlp smartmontools lsb-release x86_energy_perf_policy \
  pulseaudio pulseaudio-bluetooth pulseaudio-alsa \
  openssh lm_sensors tmux neovim xsel python-neovim git task \
  yaourt

sudo systemctl enable tlp.service tlp-sleep.service
