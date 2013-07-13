#!/bin/bash

_opts () {
perl -ne '
print if s/^.IP .\\fB\\-/-/ and s/\\(f(P|I|B|R)|)|".*//g;
print if s/^.IX Item .\-/-/ and s/"//g;
print if s/^.It Fl /-/;'
}

_man_generic() {
    local IFS=$'\t\n' cmd cur opts

    cur="${COMP_WORDS[COMP_CWORD]}"
    cmd=$(basename "$1")
    opts=$( for n in $(manpath | tr ':' '\n'); do \
	n="$n/man1/${cmd}.1"; \
	[ -f "$n" ] && cat "$n" | _opts; \
	[ -f "$n".gz ] && gunzip -c "$n".gz | _opts; \
	done | perl -pe 's/, | (--)/\n$1/' | sort | uniq )

    COMPREPLY=($(compgen -W "$opts" -- "$cur"))
}

# just add a line like the following
# for any command you wish completed
complete -o default -F _man_generic wget
complete -o default -F _man_generic curl
complete -o default -F _man_generic rsync

# or alternatively, use a slicker syntax
for cmd in ls wget curl rsync; do
    complete -o default -F _man_generic $cmd
done
