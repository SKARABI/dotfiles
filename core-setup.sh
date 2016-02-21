sudo pacman -S --noconfirm openssh lm_sensors tmux neovim xsel python-neovim git task
sudo pacman -S --noconfirm pulseaudio pulseaudio-bluetooth

# Power
sudo pacman -S --noconfirm acpi tlp smartmontools lsb-release x86_energy_perf_policy

sudo systemctl enable tlp tlp-sleep

sudo pacman -S --noconfirm mpd mpc ncmpcpp
mkdir -p ~/.mpd/playlists
