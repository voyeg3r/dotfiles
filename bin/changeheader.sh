#!/usr/bin/env bash
# Last Change: Nov 10 2022 10:11
# Estou usando esse modelo em um hook do git (pre-commit)

sleep 2

file="${1}"
data="$(date +"%a, %b %d %Y - %H:%M")"

echo "File: $file"
echo "hora: $data"

# sed -i "%s/^\(\S\+ [Ll]ast [Cc]hange: \).*/\1$data/g" "$file"
