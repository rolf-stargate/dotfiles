
#!/bin/sh

pacman_packages=(
"arandr"
"archiso"
"bat"
"bluez"
"chromium"
"cmake"
"cups"
"deno"
"dialog"
"dmenu"
"enscript"
"ethtool"
"fakeroot"
"feh"
"firefox"
"fzf"
"gcc"
"gcolor3"
"gdb"
"gifsicle"
"git"
"gnome-font-viewer"
"gnome-keyring"
"gnome-screenshot"
"gnome-themes-extra"
"gparted"
"gphoto2"
"htop"
"i3"
"i3blocks"
"i3status"
"keepassxc"
"lazygit"
"libvirt"
"lxappearance"
"ly"
"make"
"mpv"
"ncspot"
"neofetch"
"neovim"
"networkmanager"
"nmap"
"openssh"
"openvpn"
"oxipng"
"pipewire"
"pipewire-jack"
"pipewire-pulse"
"powertop"
"psensor"
"python-pip"
"python-pylint"
"python-virtualenv"
"qemu-desktop"
"qemu-hw-usb-redirect"
"qemu-system-x86"
"qmk"
"qrencode"
"ripgrep"
"rofi"
"rsync"
"rust-src"
"rustup"
"rxvt-unicode"
"signal-desktop"
"simple-scan"
"speedcrunch"
"stylua"
"sxiv"
"ttf-anonymous-pro"
"ttf-dejavu"
"ttf-fira-code"
"ttf-font-awesome"
"ttf-inconsolata"
"ttf-iosevka-nerd"
"ttf-nerd-fonts-symbols"
"ttf-ubuntu-mono-nerd"
"udiskie"
"ueberzug"
"unrar"
"unzip"
"urxvt-perls"
"vifm"
"virt-manager"
"virt-viewer"
"wasm-pack"
"wget"
"xclip"
"xdg-utils"
"xdotool"
"xorg-server"
"xorg-xcalc"
"xorg-xclock"
"xorg-xinit"
"xorg-xwayland"
"ytfzf"
"zathura"
"zathura-pdf-poppler"
"zenity"
"zip"
"zsh"
"zsh-completions"
)

echo "Updating Packages Pacman"
sudo pacman -Syu --noconfirm &&
echo "Installing Packages Pacman"
sudo pacman -S "${pacman_packages[@]}"

aur_packages=(
"anki"
"bluetuith-bin"
"cpu-x"
"dirbuster"
"dropbox"
"google-chrome"
"looking-glass"
"multitail"
"ncpamixer"
"neovim-web-devicons-git"
"nerd-fonts-noto-sans-mono-extended"
"nvm"
"opentabletdriver"
"python2"
"terminess-powerline-font-git"
"trash"
"ttf-dejavu-sans-mono-powerline-git"
"ttf-iosevka"
"urxvt-fullscreen"
"urxvt-resize-font-git"
"userspace-tablet-driver-gui"
"vifm-colors-git"
"windows95-electron-bin"
"wol-systemd"
"xinput-gui"
"xournal"
"xp-pen-tablet"
"yay-git"
)

echo "Installing Packages AUR"
git clone https://aur.archlinux.org/yay.git &&
cd ~/yay &&
makepkg -si &&
yay -S "${aur_packages[@]}"

echo "Git Clone Scripts"
git clone git@github.com:rolf-stargate/scripts.git  &&
echo "Git Clone I3"
git clone git@github.com:rolf-stargate/i3.git ~/.config/i3 &&
echo "Git Clone VIFM"
git clone git@github.com:rolf-stargate/vifm.git ~/.config/vifm &&
echo "Git Clone NVIM"
git clone git@github.com:rolf-stargate/nvim.git ~/.config/nvim &&
echo "Git Clone HOME"
git clone git@github.com:rolf-stargate/home.git ~/.config/home &&

echo "Create Links For HOME"
for i in $(ls ~/.config/home); do
  ln -s ~/.config/home/$i ~/$i
done

echo "Installing Cron Jobs"
(crontab -l; echo "0 * * * * cd ~/.config/nvim/ && ./git.sh") | sort - | uniq - | crontab - &&
(crontab -l; echo "0 * * * * cd ~/.config/home/ && ./git.sh") | sort - | uniq - | crontab - &&
(crontab -l; echo "0 * * * * cd ~/.config/vifm/ && ./git.sh") | sort - | uniq - | crontab - &&
(crontab -l; echo "0 * * * * cd ~/.config/i3/ && ./git.sh") | sort - | uniq - | crontab - &&
(crontab -l; echo "0 * * * * cd ~/Scripts/ && ./git.sh") | sort - | uniq - | crontab - &&
