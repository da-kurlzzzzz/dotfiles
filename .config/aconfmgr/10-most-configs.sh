CopyFile /usr/share/kbd/keymaps/i386/qwerty/ru.map.gz
CopyFile /usr/local/bin/notify-send 755
CopyFile /usr/local/bin/xdg-open 755
CopyFile /etc/pacman.conf
CopyFile /etc/profile.d/no-beep.sh
CopyFile /etc/modprobe.d/disable-ntfs3.conf
CopyFile /etc/xdg/reflector/reflector.conf
CopyFile /etc/locale.conf
CopyFile /etc/kernel/cmdline
CopyFile /etc/ssh/ssh_config.d/50-trust-hostkey.conf
CopyFile /etc/ssh/ssh_config.d/10-silence-quantum.conf
CopyFile /etc/ssh/sshd_config.d/90-silent.conf
CopyFile /etc/ssh/sshd_config.d/10-security.conf
CopyFile /etc/ssh/sshd_config.d/50-x-forward.conf
CopyFile /etc/conf.d/pacman-contrib
CopyFile /etc/X11/xorg.conf.d/01-touchpad.conf
CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf
CopyFile /etc/makepkg.conf.d/nodebug.conf
CopyFile /etc/systemd/logind.conf.d/10-no-sleep-lid.conf
CopyFile /etc/systemd/logind.conf.d/10-power-key-ignore.conf
CopyFile /etc/systemd/system/wondershaper.service.d/10-no-fail-on-exit.conf
CopyFile /etc/systemd/system/transmission.service.d/50-user-kevin.conf
CopyFile /etc/pacman.conf.d/15-use-multilib.conf
CopyFile /etc/pacman.conf.d/10-candy.conf
CopyFile /etc/polkit-1/rules.d/50-udiskie.rules
CopyFile /etc/sysctl.d/30-few-dirty-bytes.conf
CopyFile /etc/tigervnc/vncserver.users
CopyFile /etc/snmp/snmptrapd.conf
CopyFile /etc/snmp/snmpd.conf
CopyFile /etc/sudoers.d/10-allow-wheel
CopyFile /etc/vconsole.conf
CopyFile /etc/mkinitcpio.d/linux.preset
CopyFile /etc/systemd/system/getty@tty1.service.d/autologin.conf

SetFileProperty / mode 555

# To Sort
CopyFile /etc/ca-certificates/trust-source/anchors/ite_int_ca.crt
CopyFile /etc/ca-certificates/trust-source/anchors/ite_root_ca.crt
