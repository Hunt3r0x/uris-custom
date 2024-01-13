#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILENAME=$1

#PATTERN='"([^"]*\.php(?:\?[^"]*)?)"'
#PATTERN='"([^"]*\.php)"'
PATTERN='"(https?:\/\/[^\s"]+|www\.[^\s"]+|\/[^\s"]+)"'

grep -oP "$PATTERN" "$FILENAME" | while read -r line ; do
    uri=$(echo $line | sed -e 's/^"//' -e 's/"$//')
    echo "Found URI: $uri"
done
