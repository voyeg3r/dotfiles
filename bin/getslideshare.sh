#!/bin/bash

URL="${1}"

TITLE=$(echo $URL | awk -F"/" '{ print $NF }' | awk -F"?" '{ print $1 }')

mkdir -p "${TITLE}"
cd "${TITLE}"

for i in $(curl "${URL}" 2> /dev/null | grep "slide_image" | tr '"' "\n" | grep -A 1 "data-full" | grep "image.slidesharecdn"); do
    echo -n "${i} ... "
    wget -q $(echo "${i}" | awk -F"?" '{ print $1 }')
    echo "DONE"
done;

digits=$(($(ls | wc -l | wc -c)-1))
find . -name '*.jpg' | sort -V | awk 'BEGIN{ a=1 }{ printf "mv \"%s\" %0'${digits}'d.jpg\n", $0, a++ }' | bash

# In this case we are using xargs for a better memory usage
find -iname "*.jpg" -print0 | xargs -0 convert ${TITLE}.pdf

