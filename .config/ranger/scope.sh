#!/usr/bin/env bash

## this file is an addon to ranger scope.sh
## it aims to provide img2txt previews
## if they are not applicable - execute original script

## copy-paste from original
set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

## Script arguments
FILE_PATH="${1}"         # Full path of the highlighted file
PV_WIDTH="${2}"          # Width of the preview pane (number of fitting characters)
PV_HEIGHT="${3}"         # Height of the preview pane (number of fitting characters)
IMAGE_CACHE_PATH="${4}"  # Full path that should be used to cache image preview
PV_IMAGE_ENABLED="${5}"  # 'True' if image previews are enabled, 'False' otherwise.

handle_mime() {
    local mimetype="${1}"
    case "${mimetype}" in
        ## Image
        image/*)
            ## Preview as text conversion
            ## start of custom section
            image2text() {
                font_width=8
                font_height=20
                img2txt --gamma=0.6 -x "$font_width" -y "$font_height" "$@" -- "${FILE_PATH}"
            }
            if [[ $(image2text --width="${PV_WIDTH}" | wc -l) -gt "${PV_HEIGHT}" ]]; then
                image2text --height="${PV_HEIGHT}" && exit 0
            else
                image2text --width="${PV_WIDTH}" && exit 0
            fi
            ## end of custom section
    esac
}

## find original
ORIG="$(dirname $(realpath $(command -v ranger)))/ranger/data/scope.sh"
[ -x "$ORIG" ] || ORIG="$(python -c "import ranger as _; print(_.__path__[0])")/data/scope.sh"
[ -x "$ORIG" ] || ORIG=echo

## logic from the original
if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
    ## fallback
    exec "$ORIG" "$@"
fi
MIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"
handle_mime "${MIMETYPE}"

## fallback
exec "$ORIG" "$@"
