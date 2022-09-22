#!/usr/bin/env sh

# exiftool docs: http://www.sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html

# For all files in folder and subfolders
# Remove all metadata with the exception of -CreateDate and -Software
# Add time stamp to -MetaDataDate
# Apply other eBoy metadata

# Load variables
appdir=$(dirname "$0")
source "$appdir/settings.sh"

# Set metadata for all files that don't have the AttributionName set to 'eBoy'
# will not change -CreateDate and -Software tags
exiftool \
  -r \
  -all= \
  -createdate=now "-createdate<createdate" \
  "-software<software" \
  -MetaDataDate=now \
  -artist="$CREATOR" \
  -XMP-cc:AttributionName="$CREATOR" \
  -XMP-cc:AttributionURL="$EBOYURL" \
  -XMP-dc:Creator="$CREATOR" \
  -XMP-xmpRights:Owner="$CREATOR" \
  -overwrite_original \
  .
