#!/bin/bash

set -eu
set -o pipefail


site="http://localhost:4000/jekyll-course-site/"
output="$1"


set -x  # start debugging output

tmp="$(mktemp --directory)"

# TODO: Run jekyll server in background and kill after download
if ! wget --convert-links --directory-prefix "$tmp" --no-host-directories \
        --no-verbose --output-file=/tmp/wget.log --recursive \
        --reject-regex "(.*)\?(.*)" "$site"; then
  grep --before-context=1 --no-group-separator 'ERROR' /tmp/wget.log \
      | sed 'N;s/\n/ /'  # join successive lines
  exit 1
fi

# convert links (e.g., JavaScript redirects) that aren't handled by wget
grep --files-with-matches --recursive "$site" "$tmp" \
        | xargs sed --in-place "s|$site||g"

# wget creates a "clean" export of the site, which updates all the timestamps;
# only overwrite files whose checksums differ
rsync -ahPuvz --no-times --checksum --ignore-times "$tmp/" "$output/"

{ set +x; } 2> /dev/null
echo "Completed export of Jekyll site to $output"
