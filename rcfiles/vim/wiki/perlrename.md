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

### interesting options

If you want to do a dry run to make sure you don't clobber any files, add the -n switch to the command

### adding left zeros
[link: stackoverflow](http://stackoverflow.com/questions/14327613/)

    perl-rename 's/(\d+)/sprintf("%03d", $1)/e' *.txt

### To rename all files matching *.bak to strip the extension, you might say

    rename 's/\e.bak$//' *.bak

### To translate uppercase names to lower, you'd use

    rename 'y/A-Z/a-z/' *

    prename 'tr/A-Z/a-z/' *
