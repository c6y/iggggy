#!/usr/bin/env sh

appdir=$(dirname "$0")

# compress all PNGs that have not been compressed (Software!=zopflipng)
# compressed files will have their -Software tag set to 'zopflipng'
# and keep -CreateDate tag, if defined on the original
source "$appdir/zopfli-folder.sh"
echo "*** finished compression of all PNGS ************************************"

# apply eBoy exif metadata to all images that have not been processed
# if -XMP-cc:AttributionName is 'eBoy' file will be skipped
source "$appdir/eboyexif-folder.sh"
echo "*** finished adding exif to all files ***********************************"
