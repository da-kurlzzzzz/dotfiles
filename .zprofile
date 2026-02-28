source ~/.envrc
if command -v uwsm &> /dev/null && [ "${XDG_VTNR}" -eq 1 ] && uwsm check may-start 1; then
    exec systemd-cat -t uwsm_start uwsm start sway.desktop
elif command -v startx &> /dev/null && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
    exec startx
fi
