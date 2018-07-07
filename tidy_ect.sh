#!/usr/bin/bash
#
#   tidy_ect.sh - Losslessly and efficiently compress files with ect.
#
#   Copyright (c) 2018 William J. Bowman <wjb@williamjbowman.com>


[[ -n "$LIBMAKEPKG_TIDY_ECT_SH" ]] && return
LIBMAKEPKG_TIDY_ECT_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/option.sh"


packaging_options+=('ect' 'ect_png' 'ect_jpg' 'ect_zip' 'ect_jar' 'ect_gzip')
tidy_modify+=('tidy_ect')

ECT_OPTS="-9 -keep --strict --mt-deflate"

tidy_ect() {
	if check_option "ect" "y"; then
    msg2 "$(gettext "Compressing files with ect...")"
    options+=('ect_png' 'ect_jpg' 'ect_zip' 'ect_jar' 'ect_gzip')
  fi

	if check_option "ect_png" "y"; then
		msg2 "$(gettext "Compressing PNGs ....")"
    #find . -depth -type f -iname "*.png" -print0 | xargs -0 -r ect $ECT_OPTS
    find . -depth -type f -iname "*.png" -exec ect $ECT_OPTS '{}' \;
  fi

	if check_option "ect_jpg" "y"; then
    msg2 "$(gettext "Compressing JPGs ....")"
    #find . -depth -type f -iname "*.jpg" -or -iname "*.jpeg" -print0 | xargs -0 -r ect -progresive $ECT_OPTS
    find . -depth -type f -iname "*.jpg" -or -iname "*.jpeg" -exec ect -progresive $ECT_OPTS '{}' \;
  fi

	if check_option "ect_zip" "y"; then
		msg2 "$(gettext "Compressing ZIPs ....")"
    #find . -depth -type f -iname "*.zip" -print0 | xargs -0 -r ect -zip $ECT_OPTS 2>/dev/null
    find . -depth -type f -iname "*.zip" -exec ect -zip $ECT_OPTS '{}' \; 2>/dev/null
  fi

#	if check_option "ect_jar" "y"; then
#    msg2 "$(gettext "Compressing JARs ....")"
#    #find . -depth -type f -iname "*.jar" -print0 | xargs -0 -r ect -zip $ECT_OPTS 2>/dev/null
#  fi

  if check_option "ect_gzip" "y"; then
		msg2 "$(gettext "Compressing GZIPs ....")"
    #find . -depth -type f -iname "*.gzip" -or -iname "*.gz" -print0 | xargs -0 -r ect -gzip $ECT_OPTS 2>/dev/null
    find . -depth -type f -iname "*.gzip" -or -iname "*.gz" -exec ect -gzip $ECT_OPTS '{}' \; 2>/dev/null
  fi
}
