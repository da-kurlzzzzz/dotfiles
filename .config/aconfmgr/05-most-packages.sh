# Base System & Hardware
AddPackage base
AddPackage linux
AddPackage linux-firmware
AddPackage alsa-utils
#echo unmute channels
AddPackage bluez
#systemctl enable --now bluetooth
AddPackage bluez-utils
#echo add devices
#echo optional for blueberry
AddPackage cups
#systemctl enable --now cups
AddPackage system-config-printer
#echo add printers and auto configure them
AddPackage numlockx
AddPackage upower
AddPackage iwd
#echo wi-fi networks
#systemctl enable --now iwd
AddPackage blueman
AddPackage brightnessctl
AddPackage dmidecode
AddPackage ethtool
AddPackage f2fs-tools
AddPackage grub
AddPackage hdparm
AddPackage intel-media-driver
AddPackage linux-firmware
AddPackage lshw
AddPackage usbutils
AddPackage vulkan-intel
AddPackage acpi
AddPackage wol
AddPackage --foreign blueberry
AddPackage --foreign mkinitcpio-firmware
AddPackage --foreign rtl8821ce-dkms-git
AddPackage fwupd

# Desktop Environment & UI
AddPackage xorg-server
AddPackage xorg-xinit
AddPackage xorg-xinput
AddPackage xorg-xev
AddPackage i3-wm
AddPackage dmenu
#echo optional for i3-wm
AddPackage i3blocks
#echo optional for i3-wm
AddPackage playerctl
#echo optional for i3-wm
AddPackage perl-anyevent-i3
AddPackage i3lock
#echo optional for i3-wm
AddPackage xss-lock
#echo optional for i3-wm
AddPackage alacritty
AddPackage foot
AddPackage lxappearance
#echo might add config files later
AddPackage nwg-look
AddPackage gnome-themes-extra
AddPackage unclutter
AddPackage qt5ct
AddPackage --foreign dragon-drop
AddPackage autorandr
AddPackage copyq
AddPackage grim
AddPackage pipewire
AddPackage pipewire-pulse
AddPackage qt6ct
AddPackage slurp
AddPackage sway
AddPackage sway-contrib
AddPackage swayidle
AddPackage swaylock
AddPackage wireplumber
AddPackage wmctrl
AddPackage xdg-desktop-portal-gtk
AddPackage xdg-desktop-portal-wlr
AddPackage xorg-xset
AddPackage xorg-xwayland
AddPackage xorg-xwininfo
#AddPackage --foreign clipboard
#AddPackage --foreign easy-switcher
AddPackage --foreign extramaus
AddPackage --foreign gtk-theme-material-black
#AddPackage --foreign i3-resurrect
AddPackage --foreign kbdd-git
AddPackage --foreign swaykbdd
AddPackage --foreign yaru-colors-gtk-theme
AddPackage kanshi
AddPackage uwsm
AddPackage wayland-protocols
AddPackage xorg-xeyes
AddPackage ydotool
AddPackage tigervnc
AddPackage wayvnc
AddPackage remmina
AddPackage freerdp
AddPackage rofi
AddPackage --foreign anydesk-bin

# Fonts & Language Support
AddPackage noto-fonts
AddPackage noto-fonts-cjk
#echo optional for noto-fonts
AddPackage noto-fonts-emoji
#echo optional for noto-fonts
AddPackage noto-fonts-extra
#echo optional for noto-fonts
AddPackage --foreign ttf-ms-fonts
AddPackage enca
AddPackage python-unidecode

# Development Tools
AddPackage base-devel
#echo sudoers
AddPackage git
AddPackage gvim
AddPackage python
AddPackage python-pip
#echo optional for python
AddPackage cmake
AddPackage --foreign yay
AddPackage expac
AddPackage ctags
AddPackage --foreign logisim
AddPackage gnuplot
AddPackage devtools
AddPackage arch-install-scripts
AddPackage archiso
AddPackage mkosi
AddPackage archlinux-contrib
AddPackage virtualbox
#echo create boxes
AddPackage sqlite
AddPackage sqlite-doc
#echo optional for sqlite
AddPackage gdb
AddPackage sdl3
AddPackage sdl2-compat
AddPackage sdl2_image
AddPackage sdl2_gfx
AddPackage sdl2_net
AddPackage sdl2_mixer
AddPackage sdl2_ttf
AddPackage nlohmann-json
#AddPackage --foreign cpp-httplib
AddPackage uthash
AddPackage valgrind
AddPackage utf8cpp
AddPackage cjson
AddPackage code
AddPackage gcovr
AddPackage lcov
AddPackage libqmi
AddPackage meson
AddPackage npm
AddPackage perf
AddPackage php
AddPackage sdl2-compat
AddPackage sfml
#AddPackage --foreign clion
#AddPackage --foreign clion-cmake
#AddPackage --foreign clion-gdb
#AddPackage --foreign clion-lldb
AddPackage --foreign emmet-vim-git
AddPackage --foreign include-what-you-use
AddPackage --foreign shc
AddPackage --foreign vim-mesonic-git
AddPackage clang
AddPackage python-matplotlib
AddPackage tk
AddPackage --foreign vim-ansiesc
AddPackage --foreign vim-sensible
AddPackage vim-ale
AddPackage lxc
AddPackage mariadb
AddPackage ollama
AddPackage postgresql
AddPackage postgresql-old-upgrade
AddPackage pycharm-community-edition
AddPackage qemu-base
AddPackage qemu-desktop
AddPackage arch-wiki-docs
AddPackage asciidoc
AddPackage python-aiorpcx
AddPackage python-pyfuse3
AddPackage qemu-full
AddPackage uboot-tools
AddPackage diffuse
AddPackage upx
AddPackage --foreign ddd

# System Utilities
AddPackage htop
AddPackage strace
#echo optional for htop
AddPackage nethogs
#echo setcap as described in manual
AddPackage ranger
AddPackage xclip
AddPackage ascii
AddPackage gucharmap
AddPackage man-db
AddPackage man-pages
AddPackage texi2html
AddPackage tldr
AddPackage time
AddPackage wget
AddPackage yq
AddPackage pacman-contrib
AddPackage reflector
#systemctl enable --now reflector
AddPackage --foreign downgrade
AddPackage xdotool
AddPackage lostfiles
AddPackage pkgstats
AddPackage speedtest-cli
AddPackage qalculate-gtk
AddPackage binwalk
AddPackage handlr-regex
AddPackage lsof
AddPackage pacutils
AddPackage pv
AddPackage stress
AddPackage syslinux
AddPackage systemd-resolvconf
AddPackage --foreign pinfo
AddPackage rtkit
AddPackage gnome-keyring
AddPackage inxi
AddPackage polkit-gnome
AddPackage tlp
AddPackage inotify-tools

# Shell & Terminal
AddPackage zsh
AddPackage --foreign zsh-vi-mode-git
#echo optional for zsh
AddPackage pkgfile
#echo optional for zsh
AddPackage tmux
#echo prefix+I to install all
AddPackage lynx
AddPackage cmatrix
AddPackage --foreign neofetch
AddPackage onefetch
AddPackage --foreign tty-clock
AddPackage screenkey
AddPackage bash-completion
AddPackage beep
AddPackage expect
AddPackage moreutils
AddPackage shellcheck
AddPackage shfmt
AddPackage tree
AddPackage unzip
AddPackage zsh-autosuggestions
AddPackage zsh-completions
AddPackage --foreign tmux-resurrect
AddPackage task

# Media & Graphics
AddPackage feh
AddPackage gimp
AddPackage imagemagick
AddPackage img2pdf
AddPackage tesseract
AddPackage tesseract-data-eng
#echo optional for tesseract
AddPackage tesseract-data-rus
#echo optional for tesseract
AddPackage digikam
AddPackage vlc
AddPackage vlc-plugins-all
AddPackage mpv
AddPackage yt-dlp
#echo optional for mpv
AddPackage obs-studio
AddPackage --foreign openshot
#AddPackage --foreign hypnotix
AddPackage mkvtoolnix-cli
AddPackage libreoffice-still
AddPackage xreader
AddPackage djvulibre
#echo optional for xreader
AddPackage okular
AddPackage pandoc-cli
AddPackage python-weasyprint
#echo optional for pandoc-cli
AddPackage translate-shell
AddPackage steam
AddPackage --foreign rogue
AddPackage --foreign pekka-kana-2
AddPackage --foreign gtypist
AddPackage --foreign typespeed
AddPackage dwarffortress
AddPackage moonlight-qt
AddPackage wine
AddPackage wine-mono
AddPackage steam
AddPackage wine-gecko
AddPackage winetricks
AddPackage obsidian
AddPackage prusa-slicer
AddPackage --foreign youtube
AddPackage graphviz
AddPackage --foreign gnuclad
AddPackage --foreign yed
AddPackage --foreign cheese

# Internet & Communication
AddPackage firefox
#echo log into firefox account and set theme
AddPackage telegram-desktop
#echo log into account
AddPackage element-desktop
#AddPackage --foreign whatsapp-nativefier
#echo log into account
AddPackage discord
#echo log into account
AddPackage --foreign betterdiscord-installer
#echo go through installation
#echo optional for discord
AddPackage --foreign vk-messenger-bin
#echo log into account
AddPackage --foreign zoom
#echo log into account
AddPackage chromium
AddPackage --foreign skypeforlinux-bin

# Security & Privacy
AddPackage tor
#systemctl enable --now tor
AddPackage torsocks
#echo optional for tor
AddPackage torbrowser-launcher
AddPackage openssh
#systemctl enable --now sshd
AddPackage electrum
AddPackage wireguard-tools
AddPackage --foreign amneziawg-dkms
AddPackage --foreign amneziawg-tools
#AddPackage --foreign openvpn-hidemyname
AddPackage openvpn
AddPackage --foreign amneziavpn-bin
AddPackage trivy

# Storage & Backup
AddPackage timeshift
#systemctl enable --now cronie
#echo go through initial wizard
AddPackage syncthing
#echo too much hassle to backup so init everything manually
AddPackage rsync
AddPackage rclone
#echo might add config file later
AddPackage 7zip
AddPackage ntfs-3g
AddPackage --foreign ventoy-bin
AddPackage --foreign czkawka-cli-bin
AddPackage dosfstools
#echo optional for gparted
AddPackage exfatprogs
#echo optional for gparted
AddPackage mtools
#echo optional for gparted
AddPackage udiskie
AddPackage smartmontools
AddPackage xfsprogs
AddPackage borg

# Mobile & Device Support
AddPackage scrcpy
AddPackage --foreign droidcam
#echo a bit of a hassle, might document it later
AddPackage v4l2loopback-dkms
#echo optional for droidcam
AddPackage linux-headers
#echo optional for droidcam
AddPackage android-tools
#echo optional for droidcam
AddPackage gvfs-mtp
#echo optional for droidcam
AddPackage ifuse
AddPackage --foreign jmtpfs
AddPackage --foreign v4l2loopback-dc-dkms
AddPackage guvcview

# Server & Network Tools
AddPackage nginx-mainline
#echo run make from the odin project to replace config file
AddPackage certbot-nginx
#echo add https manually
#echo optional for nginx-mainline
AddPackage nmap
AddPackage openbsd-netcat
AddPackage websocat
AddPackage transmission-cli
#systemctl enable --now transmission
AddPackage fping
AddPackage ipcalc
AddPackage multipath-tools
AddPackage nfs-utils
AddPackage tcpdump
AddPackage traceroute
AddPackage arp-scan
AddPackage bind
AddPackage cloudflared
AddPackage inetutils
AddPackage iperf
AddPackage iperf3
#AddPackage --foreign monitoring-plugins
AddPackage netsniff-ng
AddPackage net-tools
AddPackage nload
AddPackage --foreign nrpe
AddPackage rp-pppoe
AddPackage sshpass
AddPackage sshuttle
AddPackage termshark
AddPackage whois
AddPackage --foreign i2util
AddPackage --foreign ifmetric
AddPackage --foreign nuttcp
AddPackage --foreign wondershaper-git
AddPackage aircrack-ng
AddPackage dnsmasq
AddPackage wireshark-cli
AddPackage wireshark-qt
AddPackage --foreign linux-wifi-hotspot
AddPackage --foreign networkd-dispatcher
AddPackage --foreign zapret-git
AddPackage ansible
AddPackage docker
AddPackage docker-compose
AddPackage podman
AddPackage --foreign icinga2
AddPackage ppp
AddPackage ettercap
AddPackage kismet
AddPackage pptpclient

# Sysadmin Tools
AddPackage apt
AddPackage cpio
AddPackage picocom
AddPackage smbclient
AddPackage debian-archive-keyring
AddPackage debootstrap
AddPackage dropbear
AddPackage lighttpd
AddPackage logrotate
AddPackage rpm-tools
AddPackage --foreign debhelper
AddPackage --foreign devscripts
AddPackage --foreign dh-autoreconf
AddPackage --foreign dh-exec
AddPackage --foreign dh-make
AddPackage --foreign equivs-git

# To Sort
AddPackageGroup nerd-fonts
AddPackage archinstall
AddPackage atop
AddPackage bluetui
AddPackage cpp-httplib
AddPackage cpupower
AddPackage hypnotix
AddPackage hyprland
AddPackage impala
AddPackage intel-ucode
# not for chimera
AddPackage libvncserver
AddPackage mesa
# not for chimera and soldier
AddPackage monitoring-plugins
AddPackage neatvnc
AddPackage ntfsprogs
AddPackage powertop
AddPackage python-pandas
AddPackage python-scikit-learn
AddPackage turbostat
AddPackage ueberzugpp
AddPackage w3m
AddPackage wev
AddPackage wiremix
AddPackage xf86-video-intel
AddPackage --foreign aconfmgr-git
AddPackage --foreign betterdiscord-installer
AddPackage --foreign browsh
AddPackage --foreign droidcam
AddPackage --foreign fluxcast-git
AddPackage --foreign metapac
AddPackage --foreign miraclecast-git
AddPackage --foreign remmina-plugin-rdesktop
AddPackage --foreign remotemouse
AddPackage --foreign rocketchat-desktop
AddPackage bluez-hid2hci
#AddPackage --foreign nvidia-390xx-dkms
# for soldier
#AddPackage nvidia-open
# for chimera
