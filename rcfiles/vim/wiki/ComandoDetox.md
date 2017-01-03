##renaming old files iso8859 from windows

This command is a powerful "detoxifier" that eliminates special chars,
spaces and all those little chars we don't like. It support several
"sequences" so be sure to check your /usr/local/etc/detoxrc while at
it... and maybe define your own

		detox -r -s utf_8 /path/to/old/win/files/dir
