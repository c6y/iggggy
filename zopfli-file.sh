#!/usr/bin/env sh
# Zopfli docs: https://github.com/google/zopfli
# compress a file, write exif tags: 'Software', 'CreateDate'

# store value of 'Software' tag
Software=$(exiftool -Software "$1")

if [[ "$Software" == *zopflipng ]];
  then
    # no need to compress if 'Software' tag is 'zopflipng'
    echo "already zopflified: $1"
  else
    # store value of 'CreateDate' tag
    CreateDate=$(exiftool -CreateDate "$1")

    # create temp png file (doesn't have to be png — but hey, why not!)
    # also ok and simpler: tmpfile=$(mktemp)
    tmpfile=$(mktemp $TMPDIR/$(uuidgen).png)

    # read source png and write result to temp file
    # the quotes are important so quotes in file names won't result in an error
    # If metadata stored in chunks should be kept, use this:
    # zopflipng -m -y --keepchunks=iTXt,tEXt "$1" "$tmpfile"
    zopflipng -m -y "$1" "$tmpfile"

    # write 'zopflipng' to exif tag 'Software'
    # also write 'CreateDate'tag
    exiftool \
      -Software="zopflipng" \
      -CreateDate="$CreateDate" \
      -overwrite_original \
      $tmpfile

    # copy temp file to source png
    mv "$tmpfile" "$1"
fi
