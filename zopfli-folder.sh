#!/usr/bin/env sh

# get directory of this script
appdir=$(dirname "$0")

# find all PNG files and run zopfli-file on each
find . -iname "*.png" -print0 | xargs -0 -I % "$appdir/zopfli-file.sh" %
