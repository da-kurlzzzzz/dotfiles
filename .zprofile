source ~/.envrc
if command -v startx &> /dev/null && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
elif command -v uwsm &> /dev/null && [ "${XDG_VTNR}" -eq 2 ] && uwsm check may-start 2; then
    exec uwsm start sway.desktop
fi
