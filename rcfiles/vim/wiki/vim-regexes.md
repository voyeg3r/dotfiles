# Vim Regexes
* [original source](http://andrewradev.com/2011/05/08/vim-regexes/)

May 8, 2011

Finding and replacing strings are often-used operations when editing text and
vim has a full-featured regex engine to aid in that. Unfortunately, it’s one of
a kind – neither POSIX- nor perl-compatible, though mostly the latter. There
are various differences with perl, though, and minor oddities that can be
pretty annoying until you get used to them, so I’ll try to explain a few of
them here.

Note: I’ll be assuming you’ve worked with some flavor of PCRE before.

## Magicness

Vim has four different modes of regexes, depending on a specific modifier in
the regex definition. Thankfully, the only thing that they affect is which
special characters need to be escaped. For example, an asterisk, `*`, is the
(kleene) star modifier when the pattern is magic or very magic, but in the
other two modes it’s just a normal symbol and you need to use `\*` to signify
the special modifier.

Note: if you want a more detailed explanation of the modes, you can always
:help magic. In fact, I highly recommend it, I’m just trying to give an
overview here.

Magic mode is activated in a pattern with an `\m`. It’s also the default
modifier – it’ll be used if you don’t include a magicness flag at all. You can
control this by using the `'magic'` option, but it’s highly recommended you
leave it as it is.

Very magic mode is activated using `\v`. This one’s pretty important, since it
makes the regex mostly `perl-compatible`, so most of what you’re probably used to
will work just fine. Unfortunately, you can’t make it the default – it’s argued
that this would cause compatibility problems between scripts (much like the
'magic' option mentioned above, but oh, well…).

Nomagic and Very nomagic modes are set with `\M` and `\V` respectively. Their
effect is turning almost all special regex symbols into ordinary ones unless
they start with a backslash. For example, in these modes, you can do a search
like this:

``` vim
/\VFoo.bar(*args)
```

This will find the exact string `Foo.bar(*args)` and if you want to use special
symbols, you have to prefix them with a backslash(`\*`, `\.`, etc.). This might
be useful every once in a while when you know precisely what you’re looking
for, but don’t want to risk accidentally using a special character somewhere.
As for the difference between the two, I believe it’s only in the end-of-line
character – It’s `$` in nomagic and `\$` in very nomagic mode.

As you may have noticed from the above example, the way to activate various
modes is to prefix the regex with the modifier flag. For example, this pattern
is in very magic mode:

``` vim
\vfoo\(bar\)
```

The regex engine is actually a bit more flexible than that, you can also change
the mode mid-pattern:

``` vim
\vfoo\(\mbar)
```

These two are the same and will match a string that contains foo(bar). Of
course, it’s not really a good idea to shift modes all the time, but it’s
useful to be aware of this. For example, you might want to extend this pattern
to match the whole line:

``` vim
let pattern = "\vfoo\(bar\)"
```

``` vim
" what we might want now is:
let full_pattern = "\v^.*foo\(bar\).*$"
```

``` vim
" this would (mostly) work in the common case, though:
let full_pattern = "^.*" . pattern . ".*$"
```

You might want to be more careful with greediness in this particular case, and
there’s also at least one potential issue I can see with the pattern, so just
consider it a simplified example. Small differences

The most annoying differences with perl regexes are related to the default
magic mode. Here are a few of the modifiers that need to be escaped with
a backslash: `+.?()`. These in particular are used fairly often and it’s easy to
make a mistake, especially when you already have a big fat regular expression
on your hands and you’re just making a small tweak.

The reason for this is probably that you need to search for these characters
fairly often when dealing with code. Regardless of whether that’s true or not,
this is the default and it’s actually not that difficult to get used to. There
are only a few of these special cases, and you can always `:help magic` whenever
you forget which ones they are. Another option when writing regexes in scripts
is to simply prefix them with a `\v` all the time. And as for interactive
searching, an interesting idea I’ve been told about is adding this mapping to
your vim configuration:

``` vim
noremap / /\v
```

The effect is that every time you try to search, the `\v` is prepended
automatically. It seems to be the next best thing to having it the default
option. Personally, I’m fairly used to the above differences, so I don’t mind
it that much.

Another interesting departure from perl is the `.\*?` construct, or the fact that
it doesn’t exist here. If you want to search for zero or more occurrences
non-greedily, you need to use `{-}` in very magic mode, or `\{-}` in any other
(magic, most notably). This might seem very strange (at least it did to me)
until you take a look at these two pattern schemes in the documentation:
`:help /{`, `:help /{-`. Turns out that `\{-}` is just an edge case of the latter one.

For a more complete overview of the differences between perl’s and vim’s regexes, just
`:help perl-patterns`. Vim-specific patterns

There are a few special constructs that are very specific to vim, since they
rely on the context of the current buffer, mode, cursor position, etc.

The first interesting one is the `\k` pattern, which matches a keyword character.
What constitutes a “keyword character” is vim’s ‘iskeyword’ option. This means
that you can modify this setting to fit different programming languages. For
example, in lisp and css, the - character is a completely valid part of an
identifier, but that’s not the case in, say, ruby. So, if you want to find all
variable assignments in a buffer, you might try something like this:

``` vim
/\k\+ =
```

There are several similar patterns and you can see them all by starting with
`:help /\i` You can also take a look at the corresponding opptions, starting from
`:help 'isfname'`

Another set of exotic patterns is the ones that use the editing context. An
example is matching the position of the current cursor, which is done with the
`\%#` pattern. A nice use case I bumped into recently was replacing the relative
file path under the cursor with an absolute one. It’s easy to get the path by
calling `expand('<cfile>')`, but how to replace it in the buffer might not be
that obvious. With the `\%#` pattern, it goes like this:

``` vim
:s/\f*\%#\f*/\=fnamemodify(submatch(0), ':p')/
```

The pattern is `\f*\%#\f*`, which matches as many filename characters (`:help /\f`)
as possible before and after the cursor position. The replacement is
a function call operating on the 0th submatch, which is the entire match.
(`:help sub-replace-expression`, `:help submatch()`

There’s also a pattern that matches only inside the current visual selection,
`\%V`, so if you want to do the same for a visually marked filename (if it
contains spaces, for example), you can do this instead:

``` vim
:s/\%V.*\%V/\=fnamemodify(submatch(0), ':p')/
```

The last set of patterns I’ll explain matches specific lines or columns. For
example, if you want to search for “foo” before line 42 of the file, you can do
it like so:

``` vim
/\<%42lfoo
```

The interesting part is `\%<42l`. The same can be done for columns with `%c`, you
can find a detailed listing of all combinations at `:help \%l`. It gets very hard
to read, and it’s not exactly easy to remember, either, so using these in
everyday searching might not be very common. Still, if you hide it behind
a command or mapping, it does have some potential.

An example that I played around with at some point was highlighting matches.
The matchit plugin, shipped by default with vim, can let you jump from opening
to closing brace, and also between ifs and their ends, switch statements and
a lot more. What I wanted to do was, instead of jumping between them, to
highlight them with a specific syntax instead.

Assuming we’ve managed to locate the current item to highlight (let’s say that
part is unimportant for this example), we can create this function to highlight
a specific area with a given syntax group:

``` vim
" a:from and a:to are arrays with line and column numbers.
" a:syn is the syntax group to use for highlighting
function! HighlightArea(syn, from, to)
  " Extract the line and column numbers we need from the arguments
  let line_to   = a:to[0]   + 1
  let col_to    = a:to[1]   + 1
  let line_from = a:from[0] - 1
  let col_from  = a:from[1] - 1

  " Make sure we don't have negative values
  let line_from = line_from >= 0 ? line_from : 0
  let col_from  = col_from  >= 0 ? col_from  : 0

  " Construct the pattern piece by piece
  let pattern  = ''
  let pattern .= '\%>' . line_from . 'l'
  let pattern .= '\%<' . line_to   . 'l'
  let pattern .= '\%>' . col_from  . 'c'
  let pattern .= '\%<' . col_to    . 'c'

  " Tell vim to highlight the pattern with the a:syn syntax group
  call matchadd(a:syn, pattern)
endfunction
```

It’s a fairly large function, but it’s mostly boilerplate and it should be
mostly understandable. It’s possible this specific use case can be accomplished
through other, less complicated means, but I hope this at least shows the power
of the line and column patterns. There’s a lot more, of course

There’s a ton of info regarding patterns and searching in the vim
documentation, of course, but I have to admit it’s pretty overwhelming. Still,
even if you don’t read it completely (I haven’t), you can find out a lot of
interesting patterns just by looking around the :helps I’ve sprinkled
throughout the post. I also highly recommend the vimcast “Refining search
patterns with the command-line window”, which contains some nice tips for
efficient experimentation.

vim:set et sw=4 ts=4:
