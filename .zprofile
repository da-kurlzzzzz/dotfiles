source ~/.envrc
if command -v startx &> /dev/null && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
elif command -v sway &> /dev/null && [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
    systemctl --user set-environment WLR_DRM_NO_ATOMIC=1
    exec systemctl --wait --user start sway.service
fi
