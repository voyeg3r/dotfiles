# Vim regexes are awesome
* [source](http://briancarper.net/blog/448.html)

Last Change: qui 12 jan 2017 14:25:47 BRT

Two years ago I wrote about how Vim's regexes were no fun compared to :perldo
and :rubydo. Turns out I was wrong, it was just a matter of not being used to
them.

Vim's regexes are very good. They have all of the good features of Perl/Ruby
regexes, plus some extra features that don't make sense outside of a text
editor, but are nonetheless very helpful in Vim.

#### Here are a few of the neat things you can do.

Vim regexes are inconsistent when it comes to what needs to be
backslash-escaped and what doesn't, which is the one bad thing. But Vim lets
you put \v to make everything suddenly consistent: everything except letters,
numbers and underscores becomes "special" unless backslash-escaped.

Without `\v`:

``` vim
:%s/^\%(foo\)\{1,3}\(.\+\)bar$/\1/
```

With `\v`:

``` vim
:%s/\v^%(foo){1,3}(.+)bar$/\1/
```

Far easier to read. Along with `\c` to turn on and off case sensitivity, these
are good options to make a habit of prepending to regexes when needed. It
eventually becomes second-nature. See also `:h /\v`

One thing that `:perldo` and `:rubydo` can't do is span newlines; you can't combine
two lines and you can't break one line into two.

But Vim's regexes can span newlines if you use `\_.` instead of .. I find this to
be a lot more aesthetically pleasing than Perl's horrible s and m modifiers
tacked onto the end of a regex. e.g. this strips `<body>` tags from a text
document.

``` vim
:%s@<body>\v(\_.+)\V</body>@\1@
```

(Note: in real life, never use a regex to parse HTML or XML. Down that path
lies madness. The above is OK because I'd expect only one <body> tag to appear
in any document.)

(Note^2: being able to turn on and off magic in the middle of a regex is
awfully helpful.)

(Note^4: You can use arbitrary delimiters like @ for the regex, which is useful
if your pattern includes literal `/'s`.)

See also `:h \_.`

Vim lets you demand that some text match, but ignore that text when it comes to
the substitution part. This is handy for certain specific kinds of regexes.
Normally if you want to match some text and then leave it alone in the
substitution, you have to capture it and then put it back manually; `\zs` lets
you avoid this.

Say you want to chop some text off the end of a line, but leave the rest of the
line alone. Normally you'd have to do this:

``` vim
:%s/\v^(foobar)(baz)/\1/
```

to put the foobar back. Of course you can also use a zero-width lookbehind assertion:

``` vim
:%s/\v(^foobar)@<=baz//
```

But that's even more line-noise. This is the easiest way:

``` vim
:%s/^foobar\zsbaz//
```

See `:h /\zs`. (And `:h /\@<=` if you're so inclined.)

Using `\=`, you can put arbitrary expressions on the right side of a regex
substitution. For example say you have this text:

``` vim
~/foo ~/bar
```

If you do this:

``` vim
:%s/\v(\S+)/\=expand(submatch(1))/g
```

You end up with:

``` vim
/home/user/foo /home/user/bar
```

Because you can also call your own user-defined functions in the expression
part, this can end up being pretty powerful. For example it can be used to
insert incrementing numbers into arbitrary places in your text. See `:h sub-replace-\=`.

Read `:h regexp` if you haven't already. Tons of other features in there that can
make your life easy if you manage to internalize them. It is difficult to get
used to Vim's funky syntax if you're very familiar with Perl/Ruby-style
regexes, but I think it's worth it. Only took me two years! (OK, more like a
couple days of concerted effort after a year-and-a-half delay.)

