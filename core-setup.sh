sudo pacman -S --noconfirm openssh lm_sensors tmux neovim xsel python-neovim git task

# Power
sudo pacman -S --noconfirm acpi tlp smartmontools lsb-release x86_energy_perf_policy

sudo systemctl enable tlp tlp-sleep
