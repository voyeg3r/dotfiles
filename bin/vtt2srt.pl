#!/usr/bin/perl
use strict;
use warnings;

my $force = "";
if (($ARGV[0]||"") eq "-f") {
    $force = 1;
    shift @ARGV;
}

if (not @ARGV) {
    $0 =~ /([^\/]+)$/; # remove path from script name
    my $script = $1;
    print STDERR "usage: $script [-f] file ...\n";
    print STDERR "       creates an .srt subtitle file from a WebVTT file\n";
    print STDERR "       -f overwrites existing files\n";
    exit;
}

foreach my $file (@ARGV) {

    if (not open INFILE, $file) {
        warn "$!: $file\n";
        next;
    }

    # remove an existing extension and add .vtt
    $file =~ s/\.\w{2,4}$//;
    $file .= ".srt";

    # skip over problems with the destination file
    if (-e $file and not $force) {
        warn "Destination file exists: $file\n";
        next;
    }
    if (not open FILE, ">$file") {
        warn "$!: $file\n";
        next;
    }


    my $new_sub = 1;
    my $has_linenumbers = 0;
    my $linenumber = 1;
    foreach my $line (<INFILE>) {

        # remove any funky newline stuff
        $line =~ s/\s+$//;

        # lose the header
        if ($linenumber == 1 and $line =~ /^WEBVTT/i) {
            next;
        }

        # detect new subtitle set
        if (length($line) == 0) {
            $new_sub = 1;
            print FILE "\n";
            next;
        }

        # detect line numbers
        # (shouldn't be there, but I saw a sample with them)
        if ($new_sub and $line =~ /^\d+$/) {
            $has_linenumbers = 1;
        }
        $new_sub = 0;

        # vtt may have only minutes and seconds
        if ($line =~ /(\d\d:)?\d\d:\d\d.\d\d\d --> (\d\d:)?\d\d:\d\d.\d\d\d/) {
            $line =~ s/\./,/g;
            # remove webvtt formatting from timestamp
            $line =~ s/([\d\:\,]+ --> [\d\:\,]+) .+/$1/;
            # add line numbers if not already there
            if (not $has_linenumbers) {
                $line = $linenumber . "\n" . $line;
                ++$linenumber;
            }

        }

        print FILE $line . "\n";

    }

    # flush
    close FILE;

}

=head1 NAME

vtt2srt.pl - convert WebVTT files to .srt format

=head1 SYNOPSIS

  perl vtt2srt.pl [-f] file ...

=head1 USAGE

Provide a list of WebVTT files, and .srt files are created.

If the -f option is specified, the script will overwrite any existing
.vtt files.

=head1 AUTHOR

Jonathan Field - jfield@gmail.com
