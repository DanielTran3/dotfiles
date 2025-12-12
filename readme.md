Clone repo and copy configs into .configs folder

Commands:
-- Hyprland Stuff --
sudo pacman -S waybar
sudo pacman -S wofi
sudo pacman -S otf-font-awesome
sudo pacman -S cachyos-gaming-meta
sudo pacman -S cachyos-gaming-applications
yay -S hyprshot
yay -S swaync
yay -S hyprlock
yay -S hypridle

<!-- For  creating symlinks in foldersn-->
yay -S stow

yay -S hyprpaper
yay -Sy starship
yay -S ttf-cascadia-code-nerd
yay -S nwg-look
yay -Sy catppuccin-gtk-theme-mocha

-- Applications --
sudo pacman -S bitwarden
sudo pacman -S discord
yay -S cura-bin
yay -S superslicer-bin

To see where files are installed via yay and pacman:
yay -Ql packagename
pacman -Ql packagename

Modify fish terminal with starship by adding
starship init fish | source
to the bottom of the ~/.config/fish/config.fish file

Get icons https://www.nerdfonts.com/

TO DO: 
- Edit Waybar config
- Edit Wofi

Catppuccin for coloring and themeing. hyprmocha uses this, along with other things like nwg-look for gtk settings
hyprmocha (in hypr/mocha.conf) defines colors that other hypr components can use
