Clone repo and copy configs into .configs folder

Commands:
-- Hyprland Stuff --
sudo pacman -S waybar
sudo pacman -S wofi
<!-- https://github.com/adi1090x/rofi?tab=readme-ov-file for rofi themes -->
sudo pacman -S rofi
sudo pacman -S cachyos-gaming-meta
sudo pacman -S cachyos-gaming-applications
yay -S swaync
yay -S hyprlock
yay -S hypridle
paru -S clipvault
sudo pacman -S Konsole

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
yay -S bibata-cursor-theme

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
sudo pacman -S waterfox
sudo pacman -S satty
sudo pacman -S davinci-resolve
sudo pacman -S swayimg
sudo pacman -S imv
sudo pacman -S vlc
sudo pacman -Syu yt-dlp

-- File Manager
<!-- For Dolphin -->
sudo pacman -S qt5ct ttf-hack kvantum breeze-icons breeze
yay -S qt6ct-kde
sudo pacman -S papirus-icon-theme

<!-- December 31, 2025: Change from Dolphin to Nautilus -->
sudo pacman -S nautilus
sudo pacman -S gvfs-smb
sudo pacman -S sushi
yay -S actions-for-nautilus-git
sudo pacman -S gvfs gvfs-mtp gvfs-gphoto2 udisks2 udiskie polkit-gnome

<!-- Nautilus terminal -->
yay -S nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty

<!-- KDE Connect -->
sudo pacman -S kdeconnect xdg-desktop-portal-hyprland libei
<!-- Setup firewalls to allow kde connect -->
sudo ufw allow 1714:1764/tcp comment "kde-connect"
sudo ufw allow 1714:1764/udp comment "kde-connect"
sudo ufw reload


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

git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
Then run install script `./install.sh` to get catppuccin on kde
qt6ct will set the color scheme for qt apps

-- Rofi --
Powermenu, currently using type-1, style-1
