#!/usr/bin/env sh

appdir=$(dirname "$0")
DATE=`date +%Y:%m:%d\ %H:%M:%S%z`

echo "*** starting iggggyfication ******************* $DATE" \
  | tee -a ~/iggggylog.txt
echo "*** in: $PWD" | tee -a ~/iggggylog.txt

# compress all PNGs that have not been compressed (Software!=zopflipng)
# compressed files will have their -Software tag set to 'zopflipng'
# and keep -CreateDate tag, if defined on the original
source "$appdir/zopfli-folder.sh" | tee -a ~/iggggylog.txt
echo "--- finished compression of all PNGS ***********************************"\
  | tee -a ~/iggggylog.txt

# apply eBoy exif metadata to all images that have not been processed
# if -XMP-cc:AttributionName is 'eBoy' file will be skipped
source "$appdir/eboyexif-folder.sh" | tee -a ~/iggggylog.txt
echo "--- finished adding exif to all files **********************************\n\n"\
  | tee -a ~/iggggylog.txt
