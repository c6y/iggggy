#!/usr/bin/env sh

# exiftool docs: http://www.sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html
# For a single file
# Remove all metadata with the exception of 'CreateDate'
# Add time stamp to 'MetaDataDate'
# Apply other eBoy metadata
# overwrite original but preserve file modification date/time

CREATOR="eBoy"
THISYEAR=`date +'%Y'`
DATE=`date +%Y:%m:%d\ %H:%M:%S%z`
COPYRIGHT="©"$THISYEAR" eBoy (Kai Vermehr, Steffen Sauerteig, Svend Smital), all rights reserved."
EBOYURL="http://hello.eboy.com"
LICENSE="https://creativecommons.org/licenses/by-nc-nd/4.0/"
LEGALCODE="https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"

FILE=$1

exiftool \
  -all= \
  -TagsFromFile @ -CreateDate -Software \
  -MetaDataDate="$DATE" \
  -artist="$CREATOR" \
  -rights="$COPYRIGHT" \
  -XMP-dc:Creator="$CREATOR" \
  -XMP-cc:License="$LICENSE" \
  -XMP-cc:LegalCode="$LEGALCODE" \
  -XMP-cc:Jurisdiction="International" \
  -XMP-cc:AttributionName="$CREATOR" \
  -XMP-cc:AttributionURL="$EBOYURL" \
  -XMP-cc:Requires="Attribution" \
  -XMP-cc:Prohibits="Commercial Use" \
  -XMP-xmpRights:Marked=true \
  -overwrite_original \
  -P \
  $FILE

# echo "--- eboyexif added to image: '$FILE' \n"
