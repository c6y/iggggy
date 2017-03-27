#!/usr/bin/env sh

# exiftool docs: http://www.sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html

# For all files in folder and subfolders
# Remove all metadata with the exception of -CreateDate and -Software
# Add time stamp to -MetaDataDate
# Apply other eBoy metadata

CREATOR="eBoy"
THISYEAR=`date +'%Y'`
DATE=`date +%Y:%m:%d\ %H:%M:%S%z`
COPYRIGHT="©"$THISYEAR" eBoy (Kai Vermehr, Steffen Sauerteig, Svend Smital), all rights reserved."
EBOYURL="http://hello.eboy.com"
LICENSE="https://creativecommons.org/licenses/by-nc-nd/4.0/"
LEGALCODE="https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"

# Set metadata for all files that don't have the AttributionName set to 'eBoy'
# will not change -CreateDate and -Software tags
exiftool \
  -r \
  -if 'not defined $XMP-cc:AttributionName or not $XMP-cc:AttributionName =~ /eBoy/' \
  -all= \
  -createdate=now "-createdate<createdate" \
  "-software<software" \
  -MetaDataDate=now \
  -artist="$CREATOR" \
  -rights="$COPYRIGHT" \
  -XMP-cc:AttributionName="$CREATOR" \
  -XMP-cc:License="$LICENSE" \
  -XMP-cc:LegalCode="$LEGALCODE" \
  -XMP-cc:Jurisdiction="International" \
  -XMP-cc:AttributionURL="$EBOYURL" \
  -XMP-cc:Permits="Sharing" \
  -XMP-cc:Requires="Attribution" \
  -XMP-cc:Prohibits="Commercial Use" \
  -XMP-dc:Creator="$CREATOR" \
  -XMP-xmpRights:Marked=true \
  -overwrite_original \
  .
