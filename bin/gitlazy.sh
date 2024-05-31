
#!/usr/bin/bash
# File: ~/.dotfiles/bin/gitlazy.sh
# Last Change: Fri, 09 Feb 2024 - 13:27:33

git commit -am "$1"
git pull --quiet
git push
