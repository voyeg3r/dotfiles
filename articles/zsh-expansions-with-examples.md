A Guide to Zsh Expansion with Examples

### Menu

[](#)

*   [Home](https://thevaluable.dev/)
*   [All Articles](https://thevaluable.dev/post/)
*   [Let's Connect](https://thevaluable.dev/page/newsletter/)
*   [Books](https://thevaluable.dev/page/books/)
*   [Support](https://thevaluable.dev/page/support/)
*   [About](https://thevaluable.dev/page/about)

* * *

### Categories

*   [Complexity](https://thevaluable.dev/tags/complexity)
*   [Fundamentals](https://thevaluable.dev/tags/fundamentals)
*   [Mouseless](https://thevaluable.dev/tags/mouseless)
*   [Vim](https://thevaluable.dev/tags/vim)
*   [Soft Skills](https://thevaluable.dev/tags/soft-skills)
*   [Learning](https://thevaluable.dev/tags/learning)
*   [Side Projects](https://thevaluable.dev/tags/side-project)

  [RSS](https://thevaluable.dev/index.xml)

[Close](#)

*   [Glob Operators](#glob-operators)
    *   [Basic Glob Operators](#basic-glob-operators)
    *   [Character classes](#character-classes)
    *   [Grouping](#grouping)
    *   [Globbing Flags](#globbing-flags)
    *   [Recursive Globbing](#recursive-globbing)
    *   [Glob Qualifiers](#glob-qualifiers)
    *   [Expanding A Precise Number of Files](#expanding-a-precise-number-of-files)
    *   [Expanding and Sorting](#expanding-and-sorting)
    *   [Expanding Depending on a Predicate](#expanding-depending-on-a-predicate)
*   [Expanding the Zsh History](#expanding-the-zsh-history)
    *   [The Event Designators](#the-event-designators)
    *   [Word Designators](#word-designators)
    *   [History Modifiers](#history-modifiers)
    *   [The Substitution Modifier](#the-substitution-modifier)
*   [Parameters Expansion](#parameters-expansion)
    *   [The Dollar Character](#the-dollar-character)
    *   [Parameters Expansion: Adding Braces](#parameters-expansion-adding-braces)
*   [You Can Now Become a Zsh Godly Figure](#you-can-now-become-a-zsh-godly-figure)

[The Valuable Dev](https://thevaluable.dev/)

*   [Let's Connect](https://thevaluable.dev/page/newsletter)
*   [Books](https://thevaluable.dev/page/books)
*   [Support](https://thevaluable.dev/page/support)
*   [About](https://thevaluable.dev/page/about)

[☰  Menu](#)[](#)[](#)

[](#)

27 Dec 2021 [Twitter](https://twitter.com/share?text=A%20Guide%20to%20Zsh%20Expansion%20with%20Examples - The%20Valuable%20Dev&url=https%3a%2f%2fthevaluable.dev%2fzsh-expansion-guide-example%2f)

[#Tools](https://thevaluable.dev/tags/tools/) [#Mouseless](https://thevaluable.dev/tags/mouseless/)

A Guide to Zsh Expansion with Examples
======================================

![A Guide to Zsh Expansion with Examples](https://thevaluable.dev/images/2021/zsh_expansion/expand_happiness.jpg)

This article is part of a series about Zsh:

Becoming a zsh master

1.  [Configuring Zsh Without Dependencies](https://thevaluable.dev/zsh-install-configure-mouseless/)
2.  [A Guide to Zsh Expansion with Examples](https://thevaluable.dev/zsh-expansion-guide-example/)
3.  [A Guide to the Zsh Completion with Examples](https://thevaluable.dev/zsh-completion-guide-examples/)
4.  [A Guide to the Zsh Line Editor with Examples](https://thevaluable.dev/zsh-line-editor-configuration-mouseless/)

What would we do if we couldn’t use the wonderful `TAB` key to expand our commands, filenames, or variables in our lovely shell? Not much, I’m afraid. We would still live in dark caves, hunting some dangerous Mammoth with knives made of stones!

Zsh is particularly powerful when you need some good old expansions. It supports common ones used by Bash too, and add many flags and modifiers on top. It comes in handy to manipulate quickly your commands without writing boring shell scripts.

We’ll see, in this article, what we can do with Zsh expansions, and more specifically:

*   How to use glob operators and globbing flags.
*   What glob qualifiers we can use to expand filenames.
*   How to expand the Zsh history and how to modify these expansions.
*   How to expand parameters, using modifiers and flags.

In the examples of this article, the character `>` represents the shell’s prompt. If you want to run the commands in your terminal (which I warmly recommend you to do), don’t copy these `>` characters. Why not using the dollar character `$` for the prompt, like every other articles out there? Because it’s my article, I do what I want.

There are many, many ways to expand your filenames, history entries, or parameters with Zsh. I won’t cover everything here, only what I find the most useful. The amount of information can still be overwhelming, however; that’s why I recommend the following:

1.  Take two or three useful tips from this article and try to apply them in your daily work.
2.  When you’re confident with your new knowledge, come back to this article and pick two or three more tips.
3.  Rinse and repeat.

Last bit of information before diving in: I used Zsh 5.8 and GNU Bash 5.1.8 for testing the different examples. With that out of the way, let’s begin to expand our souls.

Glob Operators
--------------

We can’t use regular expressions with Bash or Zsh to expand our filenames. Instead, we can use glob operators to expand various filenames.

If you use the shell for long enough, I’m sure you’re already familiar with some of them. Here’s the list of glob operators for Zsh: `*`, `(`, `|`, `<`, `[`, and `?`.

We’ll see in this section how to use these glob operators. The examples given here follow this set of rules:

1.  The first line is the non-expanded version of the command.
2.  The second line is the expanded version of the command, after typing the non-expanded version and hitting the `TAB` key.
3.  Each example uses the following directory structure:

    .
    ├── a_dir_with_a_file
    │   └── a_file
    ├── A_FILE_WITH_UPPERCASE
    ├── another_file
    ├── empty_dir
    ├── file_1
    └── file_2


I encourage you to create the exact same file tree with these commands and try the examples in your shell:

    mkdir a_dir_with_a_file empty_dir \
    && touch a_dir_with_a_file/a_file A_FILE_WITH_UPPERCASE another_file file_1 file_2


Trying by yourself will let you feel the power of Zsh under your fingertips. Nothing less!

### Basic Glob Operators

These two basic glob operators work in Bash and Zsh:

*   `*` - Matches any string.
*   `?` - Matches any character.

For example:

    > cat fil*
    > cat file_1 file_2

    > cat file_?
    > cat file_1 file_2

    > ls ./*file*
    > ls ./a_dir_with_a_file ./another_file ./file_1 ./file_2


### Character classes

Beyond the useful `*` and `?`, we can also use character classes in both Bash and Zsh:

*   `[]` - Matches one of the enclosed character, or a range of characters separated with `-`.
*   `[:<set>:]` - Matches a specific set of characters.
*   `[^<set>]` or `[!<set>]` - Match any character which is _not_ in the set `<set>`.

For example:

    # Match every filename beginning with "f", "l", or "e"
    > ls [fle]*
    > ls empty_dir file_1 file_2

    # Match every filename not beginning with "a"
    > ls [^a]*
    > ls A_FILE_WITH_UPPERCASE empty_dir file_1 file_2

    # Match every filename beginning with "a"
    > ls [a]*
    > ls a_dir_with_a_file another_file

    # Match a filename beginning with any letter from "a" to "z"
    > ls [a-z]*
    > ls a_dir_with_a_file another_file empty_dir file_1 file_2

    # Match a filename beginning with lowercase, followed by an underscore, and any other character
    > ls [^[:upper:]]_*
    > ls a_dir_with_a_file


### Grouping

Grouping is only available in Zsh. To group, we can use the following characters:

*   `()` - Matches the enclosed pattern.
*   `|` - Equivalent of the boolean operator “OR”. It needs to be used inside groups.

For example:

    # Match any filename beginning with "fi" or "an"
    > ls (fi|an)*
    > ls another_file file_1 file_2


### Globbing Flags

Globbing flags are only available in Zsh. They need to be added before any glob operator, and they need to have this syntax: `(#<flag>)`.

Here are the three most useful flags:

*   i - Case insensitive.
*   I - Case sensitive.
*   l - Lowercase match lower case or uppercase; uppercase match only uppercase.

For example:

    > cat a*
    > cat a_dir_with_a_file another_file

    > cat (#i)a*
    > cat a_dir_with_a_file A_FILE_WITH_UPPERCASE another_file

    > cat (#l)a*
    > cat a_dir_with_a_file A_FILE_WITH_UPPERCASE another_file

    > cat (#l)A*
    > cat A_FILE_WITH_UPPERCASE


### Recursive Globbing

You can also use the recursive glob operator `**` to expand the files in the working directory (like `*`) _and_ every file in every subdirectory, recursively.

For example:

    # Search filenames including the substring "file" in the working directory and its subdirectories
    > ls ./**/*file*
    > ls ./a_dir_with_a_file ./a_dir_with_a_file/a_file ./another_file ./file_1 ./file_2


The depth of the directory tree doesn’t matter: Zsh will go through the whole tree and find whatever you want. You can also use the alternative glob operator `***` if you also want to parse symlink’s targets.

The recursive glob operator can be used in Bash too, but it will only expand files on the first level below the working directory. If you want it to behave like its Zsh counterpart, you need to set the option `globstar` with the following command `shopt -s globstar`.

### Glob Qualifiers

Glob qualifiers are only available in Zsh. They are added after the glob operators to filter even further the filenames expanded. They are always between parenthesis.

You can use multiple qualifiers inside the parenthesis, separated with a colon `:`.

#### Basic Qualifiers

Here are some basic qualifiers:

*   `^` - Negate all qualifiers following it.
*   `-` - The qualifier works on the target of the symbolic link (and not the symbolic link itself).
*   `[<beginning>, <end>]` - Choose what filenames should be expanded, depending on their positions. Can be negative to count from last match backward.

For example:

    $ ls *
    $ ls a_dir_with_a_file A_FILE_WITH_UPPERCASE another_file empty_dir file_1 file_2

    # Only expand the second and third file
    > ls *([2,3])
    > ls A_FILE_WITH_UPPERCASE another_file


#### Directory Expansion

These qualifiers will only expand to directories, except if they’re negated with `^`.

*   `F` - Expand to non-empty directories.
*   `^F` - Expand to empty directories and non-directories (plain files).
*   `/^F` - Expand to empty directories.

    # Only expand non-empty directory
    > ls *(F)
    > ls a_dir_with_a_file

    # Only expand plain files and empty directories
    > ls *(^F)
    > ls A_FILE_WITH_UPPERCASE another_file empty_dir file_1 file_2

    # Only expand empty directories
    > ls *(/^F)
    > ls empty_dir


#### Expanding By Filetype

We can also use qualifiers to expand specific file types (plain files or directory):

*   `.` - Expand to plain files
*   `/` - Expand to directories

    # Only expand plain files
    > cat *(.)
    > cat A_FILE_WITH_UPPERCASE another_file file_1 file_2

    # Only expand directories
    > ls *(/)
    > ls a_dir_with_a_file empty_dir


#### Expansions Depending On the Permissions

To only expand files with specific permissions, we can use the following qualifiers:

Depending on the owner:

*   `*` - Expand to executable plain files.
*   `r` - Expand to owner readable files.
*   `w` - Expand to owner writable files.
*   `x` - Expand to owner executable files.
*   `U` - Expand to files or directories owned by the current user.

Depending on the world:

*   `R` - Expand to world readable files.
*   `W` - Expand to world writable files.
*   `X` - Expand to world executable files>

Depending on the group:

*   `A` - Expand to group readable files
*   `I` - Expand to group writable files
*   `E` - Expand to group executable files
*   `G` - File or directory owned by the current user’s group.

For even more control, we can specify the precise permissions:

*   `f<spec>` - Expand the files with access right matching the octal number `<spec>`. If `<spec>` is preceded by:
    *   `=` (default when none given) - `<spec>` must match the exact file-mode.
    *   `+` - At least one bit needs to be in the file-mode.
    *   `-` - The bits must not be set.

For example:

    # Set the permissions for "file_1" to 777 (world can read, write, execute)
    > chmod 777 file_1

    # Expand files the user can read
    > ls *(w)
    > ls a_dir_with_a_file A_FILE_WITH_UPPERCASE another_file empty_dir file_1 file_2

    # Only expand the files with permission 777
    > cat *(f777)
    > cat file_1

    # Only expand files when the permissions are always more than executable:
    > cat *(f-1)
    > cat A_FILE_WITH_UPPERCASE another_file file_2


#### Expansions Depending on Date or Size

It’s also possible to expand files depending on some dates:

*   `m<unit><operator><n>` - Expand to files modified `<n>` time ago.
    *   The `<unit>` can be `M` for month of 30 days, `w` for `w`eeks, `d` for `d`ays (default when nothing is given),`h` for `h`our, `m` for `m`inute, or `s` for `s`econd.
    *   The `<operator>` can be:
        *   `+` - Files accessed more than `<n>` `<unit>` ago
        *   `-` - Files accessed less than `<n>` `<unit>` ago.

The qualifier to expand only files with a specific size is similar:

*   `L<unit><operator><n>` - Expand to file with a certain size `<n>`.
    *   The unit can be `K` (Kilobyte), `M` (Megabyte), `G` (gigabyte), `T` (terrabyte).
    *   If `<operator>` is:
        *   `+` - Files more than `<n>` bytes.
        *   `-` - Files less than `<n>` bytes.
        *   To match exactly the size, don’t give an `<operator>`.

For example:

    # Delete every files greater than 1Gb recursively
    > rm **/*(LG+1)

    # Delete all empty files recursively
    > rm **/*(L0)

    # Delete all files modified in the last hour
    > rm **/*(mh-1)

    # Delete all files modified more than one hour ago
    > rm **/*(mh+1)


### Expanding A Precise Number of Files

Let’s say that you had a vision: you _know_ that you only want to expand a precise number of files. The following qualifier will grant your crazy wish:

*   `Y<n>` - Limit the expansion to `<n>` number of files

    # Only expand two files
    > ls *(Y2)
    > ls A_FILE_WITH_UPPERCASE empty_dir


### Expanding and Sorting

We can also sort our files if we want to:

*   `o<sort>` - Sort files depending on the value of `<sort>`
*   `O<sort>` - Like `o`, but sort in descending order

The value of `<sort>` can be:

*   `n` - Sort by name (the default).
*   `L` - Sort by size.
*   `l` - Sort by number of links.
*   `a` - Sort by last access.
*   `m` - Sort by last modification.
*   `c` - Sort by last inode change.
*   `d` - Files in subdirectories appear before.
*   `N` - Don’t sort anything.

For example:

    # Sort files from the smallest to the largest
    > ls *(oL)

    # Sort files from the largest to the smallest
    > ls *(OL)

    # Output the three biggest files (excluding directories) in the whole filetree
    > ls **/*(.OL[1,3])


### Expanding Depending on a Predicate

As far as I know, a predicate is not a dinosaur, but a command (or a function) returning a boolean. Here’s a qualifier to filter the expansion depending on a predicate:

*   `e:'<cmd>'` - The estring will filter the files depending on a command returning true or false. The filename being tested is available via the special variable REPLY. You can also change the value of REPLY to generate new filenames.

Here are two examples to help you understand my complicated rambling:

    # Expand every file except the ones called "file_2"
    > cat *(e:'[[ $REPLY != file_2 ]]':)
    > cat a_dir_with_a_file A_FILE_WITH_UPPERCASE another_file empty_dir file_1

    # Expand only plain files (with the qualifier "."), except the ones called "file_2"
    > cat *(e:'[[ $REPLY != file_2 ]]':.)
    > cat A_FILE_WITH_UPPERCASE another_file file_1

    # Expand only plain files, and reassign the REPLY variable to expand even more files (even if they don't exist)
    > touch *(e:'reply=(${REPLY}_{1..3})':.)
    > touch A_FILE_WITH_UPPERCASE_1 A_FILE_WITH_UPPERCASE_2 A_FILE_WITH_UPPERCASE_3 another_file_1 another_file_2 another_file_3 file_1_1 file_1_2 file_1_3 file_2_1 file_2_2 file_2_3


The form `e:'<cmd>'` can take the form `+<cmd>` if you need to call a function instead of using a command.

    # Create the function "condition"
    > condition() { [[ $REPLY == file_2 ]] }

    # Only expand file named "file_2"
    > cat *(+condition)
    > cat file_2


That was quite a ride! Let’s now abandon the glob operators, their flags, and their qualifiers, to focus on the history of Zsh.

Expanding the Zsh History
-------------------------

To me, the best way to manage the shell’s history is to use a fuzzy finder like [fzf](https://github.com/junegunn/fzf). That said, if you want to use vanilla Zsh to manipulate your history, you can use these three special characters:

*   `!` - The history character.
*   `^` - The modification character.
*   `#` - The command character.

These characters are defined in the special variable `$HISTCHARS`.

It means that you can’t use these three characters in your commands without properly escaping them. For example, If you run `echo hello!!` or `echo "hello!!"`, the shell will expand the `!!`. In that case, you would need to use simple quotes (`echo 'hello!!'`) or escaping the special characters with backslashes (`echo "hello\!\!"`).

### The Event Designators

The event designator is used to expand a command (or part of a command) from the history.

First, to display your shell’s history, you can run the command `history`, or `history -<number>` (`<number>` indicating how many commands you want to output). For example,`history -100` will display the last 100 commands you’ve executed in your shell.

Here are some nice and sweet event designators:

*   `!<number>` - Expand the `<number>`th entry from the history.
*   `!-<number>` - Expand the `<number>`th entry from the history, beginning by the most recent command.
*   `!!` - Expand the previous command executed.
*   `!<string>` - Expand the most recent command executed, starting with `<string>`.
*   `!#` - Expand to the current command you’re typing.

For example:

    # Expand the history's entry 123
    > !123

    # Expand the second most recent command.
    > !-2

    # Run a command for the following examples
    > echo "first" "second" "third"

    # Expand to the last echo command executed
    > !echo
    > echo "first" "second" "third"

    # Expand to the last command executed
    > !!
    > echo "first" "second" "third"

    # try to read install Neovim
    > pacman -S neovim
    error: you cannot perform this operation unless you are root.

    # Repeat the previous command with sudo (super handy!)
    > sudo !!
    > sudo pacman -S neovim


### Word Designators

Going down to the rabbit hole, we can add word designators to our event designator. The goal is to only expand parts of the command from the history.

The word designator needs to be separated from the event designator with a color `:`.

Here are my favorites:

*   `0` - Expand the first input word of the command.
*   `<number>` - Expand the `<number>`th argument.
*   `^` - Expand the first argument or option.
*   `$` - Expand the last argument or option.
*   `*` - Expand to all the arguments or options. If there is none, expand to the NULL value.

You know what will follow? Yes! Examples! More of them!

    > echo "first" "second" "third"

    # Expand to the first word of the last command
    > !!:0
    > echo

    # Expand to the second argument of the last command
    > echo !!:2
    > echo "second"

    # Expand to the first argument of the last command
    > echo !!:^
    > echo "first"

    # Expand to the last argument of the last command
    > echo !!:$
    > echo "third"

    # Expand to all the arguments of the last command
    > print !!:*
    > print "first" "second" "third"


### History Modifiers

Believe it or not, there’s more. Additionally, you can add some modifiers to the word designator, again separated with `:`.

As always, here are my favorites:

*   `a` - Transform a file name into an absolute path.
*   `A` - Transform a file name into an absolute path and resolve the eventual symlinks.
*   `h<number>` - Keep the `head` of the path: everything except the last component of the path. Use `<number>` to keep the `<number>` of component of the pathname. In absolute path, the root directory `/` is the first component.
*   `t<number>` - Remove all leading path components except the final one (the tail). Add a `<number>` to keep a precise amount of trailing components.
*   `r` - Remove the filename extension.
*   `l` - Convert everything to lowercase.
*   `u` - Convert everything to uppercase.

    # Run a command
    > ls ~/a_dir_with_a_file/a_dir/a_file

    # Expand to the absolute path
    > !!:^:a
    > ls /home/user/a_dir_with_a_file/a_dir/a_file

    # Expand only the head (delete the tail) - similar to dirname
    > !!:^:h
    > a_dir_with_a_file/a_dir

    # Expand only the first part of the head
    > !!:^:h1
    > a_dir_with_a_file

    # Expand only the tail (delete the head) - similar to basename
    > !!:^:t
    > a_file

    # Expand only the tail and one element before
    > !!:^:t2
    > a_dir/a_file


### The Substitution Modifier

We can also substitute one substring with another using the substitution modifier:

*   `s/<string>/<replacement>/<flag>` - Substitute `<string>` with `<replacement>` using an optional `<flag>`.
*   `gs/<string>/<replacement>/` or `s/<string>/<replacement>/:g` - Substitute globally.

If we use the [metacharacter](https://en.wikipedia.org/wiki/Metacharacter) `&` in the replacement, it will be expanded with `<string>`. If you want to use the literal symbol `&` and not the metacharacter, you need to escape it with a backslash.

If the `<string>` is empty, it uses the previous `<string>` from the previous substitution.

For example:

    > echo "hello" "hello" "bonjour"

    > !!:s/hello/bonjour
    > echo "bonjour" "hello" "bonjour"

    > !!:gs/hello/bonjour
    > echo "bonjour" "bonjour" "bonjour"

    > !!:gs/hello/& dear friend
    > echo "hello dear friend" "hello dear friend" "bonjour"


That’s all for expanding the history. Next steps: expanding variables and parameters!

Parameters Expansion
--------------------

Again, Zsh gives us many tools to expand variables and parameters.

### The Dollar Character

As you probably know, the dollar character `$` is used for variable expansion in Bash and Zsh. For example, if you define a wonderful variable `var=hello`, you can expand its value with `$var`.

Zsh, unlike Bash, can also expand arrays using the good old dollar.

For example:

    # Create a variable "var" and assign the value "hello". Spaces between `=` are not authorized (don't do "var = hello").
    > var=hello

    # Expand the variable "var"
    > echo "$var"
    > echo hello

    # Create an array with three elements
    > array=("one" "two" "three")

    # Expand the values of the array (only in Zsh)
    > echo $array
    > echo one two three


### Parameters Expansion: Adding Braces

If the name of your variable is a substring of a word, you need to add braces to specify to the shell what’s the name of the variable and what’s some common string to display. For example:

    # Create a variable "size"
    > size=12

    # The shell tries to expand the variable "sizeGb"
    > echo "This is $sizeGb"
    > echo This\ is\

    # The shell knows that it needs to expand the variable "size" (and not "sizeGb")
    > echo "This is ${size}Gb"
    > echo This\ is\ 12Gb


That’s not all: we can add modifiers to these braces, to manipulate the expansion of the variable (and not the value itself). Here’s a list of the most useful ones, all available for Bash and Zsh :

*   `${var:-default}` - If `var` is not null, the value is expanded. Otherwise, `default` is expanded. Useful when you need a default value when the variable (or parameter) is empty.
*   `${var:+default}` - If `var` is not null, `default` is expanded. Otherwise, nothing is expanded.
*   `${var#pattern}` - If the pattern match the beginning of the value of `var`, the match is deleted and the rest is expanded. Use `##` to match larger matching pattern.
*   `${var%pattern}` - If the pattern match the end of the value of `var`, the match is removed and the rest is expanded. Use `%%` to match larger matching pattern.
*   `${var/<pattern>/<replacement>}` - Replace the first pattern in `var` with `replacement`.
*   `${var//<pattern>/<replacement>}` - Replace all occurrences of `pattern` in `var` with `replacement`.

You guessed it already: I like examples. So here you go:

    # Create a variable
    > var=new-value

    # Remove the prefix "new"
    > echo "${var#new}"
    > echo -value

    # Change the value of the variable
    > var="/home/user"

    # Delete the first slash and everything before
    > ls "${var#*/}"
    > home/user

    # Delete the last slash and everything before
    > ls "${var##*/}"
    > ls user

    # Create a new variable "image"
    > image=file.png

    # Delete everything after the first dot
    > echo "${image%.*}"
    > echo file

    # Delete everything before the first dot
    > echo "${image#*.}"
    > echo png

    > var="hello hello hello"

    # Replace the first word "hello" by "bonjour"
    > echo "${var/hello/bonjour}"
    > echo bonjour\ hello\ hello

    # Replace every word "hello" by "bonjour"
    > echo "${var//hello/bonjour}"
    > echo bonjour\ bonjour\ bonjour


The following ones are only available with Zsh:

*   `${var:/<pattern>/<replacement>}` - Substitute `<pattern>` with `<replacement>`. The substitution only happens when `pattern` match the whole value of `var`.
*   `${^array}` - Substitute every element of the `array` with whatever comes before or after.
*   `${=array}` - Split a string to an array using the internal field separators. These separators are the values of the variable `$IFS`, by default whitepaces (spaces, tabs, and new lines characters).

    # The pattern matches the entire value of the variable var, so everything is replaced with "bonjour"
    > echo "${var:/hello hello hello/bonjour}"
    > echo bonjour

    # Create a new variable "array"
    > array=("one" "two" "three")

    # Expand the whole array and add the suffix ".png" to the last element
    > echo "${array}.png"
    > echo one\ two\ three.png

    # Expand every element of the array with the suffix ".png".
    # This command needs to be executed, not expanded (pressing the key "ENTER", not "TAB").
    > echo ${^array}.png
    one.png two.png three.png

    > var="a big var"

    # Assign the whole value of var to the array
    > arr=(${var})

    # Expand the first element of the array
    > echo "$arr[1]"
    > echo a\ big\ var

    # Cut the value of var and assign it to the array
    > arr=(${=var})

    > echo "$arr[1]"
    > echo a

    > echo "$arr[2]"
    > echo big


It’s also possible to nest the pair of braces. Everything will be expanded from in out.

    > var="/home/user/woupi/"

    # 1. "${var#/home}" is expanded, output: "/user/woupi"
    # 2. The output is expanded as follows: "<output>%woupi/"
    # 3. The final output is "/user/"
    > echo "${${var#/home}%woupi/}"
    > echo /user/

    > var="prefix-image.png"

    # 1. "${var#prefix-}" is expanded, output: image.png
    # 2. "${output%.*}" is expanded, output: image
    # 3. ".jpg" is added to the output, final output: image.jpg
    > echo "${${var#prefix-}%.*}.jpg"
    > echo image.jpg


#### Flags

You want more? That’s not a problem. With Zsh, you can also add flags to parameter expansions. These flags are surrounded by parenthesis `()`, just after the opening curly braces `{`. You can use as many as you want, as your heart’s content.

As always, here are the most interesting ones, with examples of course. For these examples, the expansion is not the result of hitting the key `TAB`, but by hitting the key `ENTER`.

*   `C` - Capitalise (first letter uppercase) every word.

    > var="hello i like zsh"

    > echo "${(C)var}"
    Hello I Like Zsh


*   `f` - Join strings separated with newlines.
*   `F` - Split array with each element separated with newline.

    # Assign all the files of the current directories and subdirectories to the variable "files"
    > files=$(find)

    > echo $files
    .
    ./file1
    ./file2

    > echo ${(f)files}
    . ./file1 ./file2

    > arr=(${(f)files})

    # First index of array is 1
    > echo $arr[1]
    .

    > echo $arr[2]
    ./file1

    > echo ${(F)arr}
    .
    ./file1
    ./file2


*   `i` - Sort an array (case-insensitive).

    > arr=(file_02 file_01 B_FILE a_file 02_file 01_file)

    > echo ${(i)arr}
    01_file 02_file a_file file_01 file_02


*   `O` - Sort an array in descending order. Useful when combined with `i`.

    > arr=(file_02 file_01 a_file 02_file 01_file)

    > echo ${(Oi)arr}
    file_02 file_01 a_file 02_file 01_file


*   `L` - Convert all letters to lowercase
*   `U` - Convert all letters to uppercase

    > var="file_1 FILE_2"

    > echo ${(U)var}
    FILE_1 FILE_2

    > echo ${(L)var}
    file_1 file_2


*   `t` - Describe the type of the variable. It can be:
    *   scalar
    *   array
    *   integer
    *   float
    *   association

    > arr=("one" "two")

    > echo ${(t)arr}
    array

    # Create an associative array
    > declare -A assoc=("key" "value")

    > echo ${(t)assoc}
    association


*   `u` - Only expand the unique words in an array, even if these words are repeated multiple times.

    > arr=("one" "two" "two" "three")

    > echo ${(u)arr}
    one two three


*   `k` - Expand the keys instead of the values from an associative array.
*   `v` - Used with k, expand both key and value from an associative array

    > declare -A assoc=("key" "value")

    > echo ${assoc}
    value

    > echo ${(k)assoc}
    key

    > echo ${(kv)assoc}
    key value


*   `S` - Adding this flag with `#`, `##`, `%`, or `%%` will match a substring.

    > var="/home/user/workspace/tvd"

    > echo "${var#home*}"
    /home/user/workspace/tvd

    > echo "${(S)var#home*}"
    //user/workspace/tvd

    > echo ${(S)var##home*}
    /

    > echo ${(S)var%work*}
    /home/user/space/tvd

    > echo ${(S)var%%work*}
    /home/user/


*   `M` - Adding this flag with `#`, `##`, `%`, or `%%` will output the matched portion.

    > var="/home/user"

    > echo "${var#*/}"
    home/user

    > echo "${(M)var#*/}"
    /

    > echo "${var##*/}"
    user

    > echo "${(M)var##*/}"
    /home/


You Can Now Become a Zsh Godly Figure
-------------------------------------

You can do many things with Zsh, even if it’s not always easy to figure out what. With what we’ve seen in this article, we’re now able to manipulate our expansions in more straightforward ways. No need to use annoying for loops anymore!

To summarize:

*   Glob operators can help you expand filenames, even recursively through a whole file tree. You can also add globbing qualifiers and flags to expand specific filenames.
*   Being able to run commands you’ve run in the past is really useful. Being able to modify the expansion of these commands on the fly is even better.
*   With Zsh, we can also expand parameters and variables easily using the famous dollar `$`, curly braces `{}`, and flags.

If it’s not enough for you, I invite you to read the part of the Zsh’s manual about expansion (`man zshexpn`). There’s everything we’ve covered here, and much more, if your brain can handle it. Mine was on a strike after going through it.

Related Sources

*   `man zshexpn`
*   [Zsh Documentation: Expansion](https://zsh.sourceforge.io/Doc/Release/Expansion.html)
*   [Zsh Documentation](https://zsh.sourceforge.io/Doc/Release/index-frame.html)
*   [Zsh Manual - expansion](http://web.cs.elte.hu/zsh-manual/zsh_6.html)
*   [Zsh guide: recursive globbing](https://zsh.sourceforge.io/Guide/zshguide05.html#l140)
*   [Zsh guide: glob qualifiers](https://zsh.sourceforge.io/Guide/zshguide05.html#l141)
*   [Zsh Gem: Parameter Expansion](https://www.refining-linux.org/archives/47-ZSH-Gem-13-Parameter-expansion.html)

### Let's Connect

You'll receive **each month** the last article with additional resources and updates.



[Here's how it looks](https://buttondown.email/thevaluabledev/archive/the-valuable-dev-new-article-about-vim-and-many/ "Show me your newsletter!")

You can reply to any email if you have questions, problems, or feedback. I'll write back as soon as I can.

Share Your Knowledge

var remark\_config={host:"https:\\/\\/remark42.thevaluable.dev",site\_id:'jadzD9w1sijz',components:\['embed'\],max\_shown\_comments:10};var buttons=document.getElementsByClassName("light-button");for(var i=0;i<buttons.length;i++){buttons\[i\].addEventListener('click',()=>{let theme=window.localStorage.getItem('theme');if(theme==null||theme=='light'){if(window.REMARK42!=undefined){window.REMARK42.changeTheme('dark');}} if(theme=='dark'){if(window.REMARK42!=undefined){window.REMARK42.changeTheme('light');}}});} (function(c){for(var i=0;i<c.length;i++){var d=document,s=d.createElement('script');s.src=remark\_config.host+'/web/'+c\[i\]+'.js';s.defer=true;window.addEventListener("scroll",function(){var theme=window.localStorage.getItem('theme');if(theme==null||theme=='light'){remark\_config.theme='light'}else{remark\_config.theme='dark'} (d.head||d.body).appendChild(s);},{once:true});}})(remark\_config.components||\['embed'\]);

[

A Vim Guide for Advanced Users
------------------------------



](https://thevaluable.dev/vim-advanced/)[

What's The Vim Runtime? A Guide With Examples
---------------------------------------------



](https://thevaluable.dev/vim-runtime-guide-example/)

The Valuable Dev All right reserved - 2021

[](https://thevaluable.dev/page/newsletter)  [](https://github.com/phantas0s)  [](https://youtube.com/channel/UCoJtk2M8bme9KXTe6F3K-Yg)  [](https://twitter.com/Cneude_Matthieu)  [](https://www.linkedin.com/in/matthieu-cneude-28038182) [](https://thevaluable.dev/index.xml)

Proudly generated by [HUGO](https://gohugo.io)

