### renaming old files iso8859 from windows

This command is a powerful "detoxifier" that eliminates special chars,
spaces and all those little chars we don't like. It support several
"sequences" so be sure to check your /usr/local/etc/detoxrc while at
it... and maybe define your own

		detox -r -s utf_8 /path/to/old/win/files/dir


### Chaging detox configuration
+ https://unix.stackexchange.com/a/361578/3157
+ http://www.gsp.com/cgi-bin/man.cgi?section=5&topic=detoxrc


At least as of detox version 1.2.0, the filtering can be customized (the
following commands/locations may need to be changed depending on your distro).
Firstly:

    cp /usr/share/detox/safe.tbl ~/mysafe.tbl

Next edit the file mysafe.tbl searching for the word "space" (around line 127)
and change the underscore to a hyphen.

    Now modify ~/.detoxrc e.g. as follows:

    sequence hyphenated {
       safe {filename "/home/MY_USSERNAME/mysafe.tbl";};
       #wipeup {remove_trailing;};
    };

    (Replace "MY_USERNAME" of course...)

Now run the following command:

    detox -vs hyphenated *


