source ~/.envrc
if command -v startx &> /dev/null && [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
