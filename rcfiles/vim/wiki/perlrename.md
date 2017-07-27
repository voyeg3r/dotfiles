# o poder do comando perl-rename

``` markdown
File:		 perlrename.md
Created:	 qua 11 jan 2017 12:06:22 BRT
Last Change: qua 11 jan 2017 12:06:25 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```


  O poder do perl-rename está ligado à grande capacidade
  do perl de lidar com expressões regulares, inclusive
  tendo algumas expressões que lhe são perticulares.

### installing real perl-rename

A lot of manuals cite rename as perl-renam but are differences
to get real rename follow this instructions:

    cpan
    cpan1> install File::Rename

    sudo ln -s /usr/local/bin/rename /usr/bin/rename.pl

### Adding leading zeros
[from stackoverflow](http://stackoverflow.com/a/13250820/2571881)

    perl-rename 's/\d+/sprintf("%02d",$&)/e' *.mkv

    OBS: remember, if you want to test first use `-n`, it will only show
    how it will be after using the command

You can also read the sprintf manual [here](http://perldoc.perl.org/functions/sprintf.html)
The sprintf is perl specific

    # Format number with up to 8 leading zeroes
    my $result = sprintf("%08d", $number);

    rename 's/\d+/sprintf("%04d",$&)/e' *.png

Another example

``` sh
$ touch {1..19}.jpg

$ ls
10.jpg  12.jpg  14.jpg  16.jpg  18.jpg  1.jpg  3.jpg  5.jpg  7.jpg  9.jpg
11.jpg  13.jpg  15.jpg  17.jpg  19.jpg  2.jpg  4.jpg  6.jpg  8.jpg

$ rename 's/\d+/sprintf("%05d", $&)/e' *.jpg

$ ls
00001.jpg  00005.jpg  00009.jpg  00013.jpg  00017.jpg
00002.jpg  00006.jpg  00010.jpg  00014.jpg  00018.jpg
00003.jpg  00007.jpg  00011.jpg  00015.jpg  00019.jpg
00004.jpg  00008.jpg  00012.jpg  00016.jpg
```

### interesting options

If you want to do a dry run to make sure you don't clobber any files, add the -n switch to the command

### adding left zeros
[link: stackoverflow](http://stackoverflow.com/questions/14327613/)

    perl-rename 's/(\d+)/sprintf("%03d", $1)/e' *.txt

### To rename all files matching *.bak to strip the extension, you might say

    rename 's/\e.bak$//' *.bak


changing file extension
+ https://unix.stackexchange.com/a/68913/3157

    prename 's/$/.md/' *

in my case I have an alias called prename

    prename 's/.txt$/.md/' *

### To translate uppercase names to lower, you'd use
OBS: prename is an alias to perl-rename

    rename 'y/A-Z/a-z/' *

    prename 'tr/A-Z/a-z/' *

### Restabelecendo espaços

    prename 'tr/_/ /' *
