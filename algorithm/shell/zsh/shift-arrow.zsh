shift-arrow() {
((REGION_ACTIVE)) || zle set-mark-command
zle $1
}
for key kcap seq widget (
    left  LFT $'\e[1;2D' backward-char
    right RIT $'\e[1;2C' forward-char
    up    ri  $'\e[1;2A' up-line-or-history
    down  ind $'\e[1;2B' down-line-or-history
    ) {
    eval "shift-$key() shift-arrow $widget"
    zle -N shift-$key
    bindkey ${terminfo[k$kcap]-$seq} shift-$key
}
