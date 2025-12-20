Clone repo and copy configs into .configs folder

Commands:
-- Hyprland Stuff --
sudo pacman -S waybar
sudo pacman -S wofi
<!-- https://github.com/adi1090x/rofi?tab=readme-ov-file for rofi themes -->
sudo pacman -S rofi
sudo pacman -S cachyos-gaming-meta
sudo pacman -S cachyos-gaming-applications
yay -S hyprshot
yay -S swaync
yay -S hyprlock
yay -S hypridle
paru -S clipvault

<!-- For  creating symlinks in folders -->
yay -S stow

<!-- Fonts -->
sudo pacman -S otf-font-awesome
yay -S ttf-cascadia-code-nerd
sudo pacman -S ttf-jetbrains-mono-nerd
yay -S maplemono-ttf
sudo pacman -S material-symbols-font
sudo pacman -S ttf-mononoki-nerd
sudo pacman -S noto-fonts noto-fonts-extra noto-fonts-emoji

yay -S hyprpaper
yay -Sy starship
yay -S nwg-look
yay -Sy catppuccin-gtk-theme-mocha

-- Applications --
sudo pacman -S bitwarden
sudo pacman -S discord
yay -S cura-bin
yay -S superslicer-bin
sudo pacman -S onlyoffice
sudo pacman -S inkscape
yay -S spotify
sudo pacman -S code
<!-- Dolphin tar.gz ui -->
sudo pacman -S ark

-- Drivers --
<!-- Logitech mouse drivers. Piper is better as it actually changes onboard memory -->
sudo pacman -S solaar
sudo pacman -S piper

<!-- Printers  -->
sudo pacman -S cups
<!-- Have cups service start on boot -->
sudo systemctl enable cups.service
<!-- Start cups service now -->
sudo systemctl start cups.service
<!-- For the munbyn printer https://forum.manjaro.org/t/munbyn-itpp941-stopped-no-available-printer/114284/3 -->
sudo pacman -Sy ghostscript

To see where files are installed via yay and pacman:
yay -Ql packagename
pacman -Ql packagename

Modify fish terminal with starship by adding
starship init fish | source
to the bottom of the ~/.config/fish/config.fish file

Get icons https://www.nerdfonts.com/

Catppuccin for coloring and themeing. hyprmocha uses this, along with other things like nwg-look for gtk settings
hyprmocha (in hypr/mocha.conf) defines colors that other hypr components can use

-- Rofi --
Powermenu, currently using type-1, style-1
