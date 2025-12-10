source ~/.envrc
if command -v startx &> /dev/null && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
elif command -v sway &> /dev/null && [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
    WLR_DRM_NO_ATOMIC=1 exec systemd-cat --identifier=sway sway
fi
