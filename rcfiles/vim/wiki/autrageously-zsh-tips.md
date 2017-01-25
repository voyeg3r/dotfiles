### Master Your Z Shell with These Outrageously Useful Tips
11 January 2014 [original](http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/)

If you had previously installed Zsh but never got around to exploring all of
its magic features, this post is for you.

If you never thought of using a different shell than the one that came by
default when you got your computer, I recommend you go out and check the
Z shell. Here are some Linux guides that explain how to install it and set it
as your default shell. You probably have Zsh installed you are on a Mac, but
there’s nothing like the warm fuzzy feeling of running the latest version
(here’s a way to upgrade using Homebrew).

While you’re at it, you should also get oh-my-zsh, a framework that makes Zsh
easier to configure. It’s pretty easy to install, just run this:

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

``` sh
echo $0
# if you don't see /bin/zsh you might need
# to open up a new window, or manually run: zsh
```

The Zsh manual is a daunting beast. Just the chapter on expansions has 32
subsections. Forget about memorizing this madness in one sitting. Instead,
we’ll focus on understanding a few useful concepts, and referencing the manual
for additional help.

The three main sections of this post are file picking, variable
transformations, and magic tabbing. If you’re pressed for time, read the
beginning of each one, and come back later to soak up the details (make sure
you stick around for the bonus tips at the end). You only learn by doing

Reading this post will only take you 10% of the way into Zsh paradise; to
really grok what it’s all about, you need to run the commands yourself. I’m
giving you everything you need to create the file structure that we’ll be using
for the entire post. Simply copy and paste this into your Zsh window:

### run me to get the party started

``` sh
# create the folder structure
mkdir -p zsh_demo/{data,calculations}/africa/{kenya,malawi}/ zsh_demo/{data,calculations}/europe/{malta,poland}/ zsh_demo/{data,calculations}/asia/{nepal,laos}/

# create dummy files inside the data folder
for country_folder in zsh_demo/data/*/*; do
    dd if=/dev/zero of="${country_folder}/population.txt" bs=1024 count=1
    dd if=/dev/zero of="${country_folder}/income.txt" bs=2048 count=1
    dd if=/dev/zero of="${country_folder}/literacy.txt" bs=4096 count=1
    # we say these are dummy files because they don't have any content,
    # but we are making them occupy disk space
done

# create dummy files inside the calculations folder
for country_folder in zsh_demo/calculations/*/*; do
    touch "${country_folder}/population_by_province.txt"    # this file is empty
    dd if=/dev/zero of="${country_folder}/median_income.txt" bs=2048 count=1
    dd if=/dev/zero of="${country_folder}/literacy_index.txt" bs=4096 count=1
done

# because all the files are nested within the zsh_demo folder you will
# be able to easily delete them by running:
# rm -r zsh_demo
```

Your file structure should look like this `zsh_demo/{data,calculations}/{continent}{/country}/{file}.txt`:

``` sh
zsh_demo
├── data
│   ├── africa
│   │   ├── kenya
│   │   │   ├── literacy.txt
│   │   │   ├── income.txt
│   │   │   └── population.txt
│   │   └── ...
│   ├── asia
│   │   ├── ...
│   └── europe
│       ├── ...
└── data
    ├── africa
    │   ├── kenya
    │   │   ├── literacy_index.txt
    │   │   ├── median_income.txt
    │   │   └── population_by_province.txt
    │   └── ...
    ├── ...
```

Although you might not initially care about continents and countries, try to
relate the examples we’ll be looking at with the type of file structure you
usually work with.

1. File picking

Warning for purists: some of the features I talk about are not exclusive to
Zsh, but I have explain them anyway before we can move on to sexier commands.

First off, globbing! A glob is a short expression that lets you select a bunch
of files. 99% of the time, there’s an asterisk involved.

    # run me please
    ls zsh_demo/**/*.txt # <= this is a glob

Globs get replaced by the names of the files that match the glob expression.
For example, the glob above lists every text file located anywhere in the
zsh_demo folder. Let’s break it down to see what each part is doing:

``` sh
# list every file directly below the zsh_demo folder
ls zsh_demo

# list every file in the folders directly below the zsh_demo folder
ls zsh_demo/*

# list every file in every folder two levels below the zsh_demo folder
ls zsh_demo/*/*

# list every file anywhere below the zsh_demo folder
ls zsh_demo/**/*

# list every file that ends in .txt in every folder at any level below the zsh_demo folder
ls zsh_demo/**/*.txt
```

We already used a glob when we specified the location of each file:

``` sh
for country_folder in zsh_demo/data/*/*; do
    # create data files for each country
done
```

This loop runs six times. See for yourself:

``` sh
print -l zsh_demo/data/*/*
# zsh_demo/africa/kenya
# zsh_demo/africa/malawi
# zsh_demo/asia/laos
# zsh_demo/asia/nepal
# zsh_demo/europe/malta
# zsh_demo/europe/poland


# you could use echo instead of print -l, but the folders would be
# separated by spaces instead of newlines
```


### Glob operators

So, what else can you stick inside a glob besides asterisks? Glance at section
14.8.1 of the manual if you want to know all the options. Here are the ones
that I find most useful:

``` sh
# list text files that end in a number from 1 to 10
ls -l zsh_demo/**/*<1-10>.txt

# list text files that start with the letter a
ls -l zsh_demo/**/[a]*.txt

# list text files that start with either ab or bc
ls -l zsh_demo/**/(ab|bc)*.txt

# list text files that don't start with a lower or uppercase c
ls -l zsh_demo/**/[^cC]*.txt
```

### Glob qualifiers

Now that we got the basic stuff out of the way, let’s dive a little deeper. We
previously mentioned this glob: `zsh_demo/**/*`, which lists every file anywhere
below the zsh_demo folder. But, what if we only want to list folders and not
regular files, or vice versa? What if we only want to list files bigger than
3 KB? Or maybe, just the last modified file? You can do all that in Zsh using
glob qualifiers:

``` sh
# show only directories
print -l zsh_demo/**/*(/)

# show only regular files
print -l zsh_demo/**/*(.)

# show empty files
ls -l zsh_demo/**/*(L0)

# show files greater than 3 KB
ls -l zsh_demo/**/*(Lk+3)

# show files modified in the last hour
print -l zsh_demo/**/*(mh-1)

# sort files from most to least recently modified and show the last 3
ls -l zsh_demo/**/*(om[1,3])
```

Glob qualifiers are surrounded in parentheses (), and appear at the end of
a glob to make it more stringent. Globs filter files by their name, and glob
qualifiers filter by any other attribute (file type, size, modification date).
They can be a bit confusing if you don’t know the syntax. Consider this glob
qualifier:

``` sh
ls -l zsh_demo/**/*(.Lm-2mh-1om[1,3])
# you won't typically write at this level of obfuscation
```

``` sh
ls -l zsh_demo/**/*(. Lm-2 mh-1 om [1,3])
# this is more parseable, but unfortunately Zsh doesn't allow spaces
# between qualifiers, so you'll get an error
```

You need to be familiar with the individual options to make sense of this
madness. Five different things are going on at the same time:

    The . tells the glob to only show regular files (no directories, symbolic links, or other types of files).
    The Lm-2 tells the glob to show files smaller than 2 MB.
        Use - for smaller, and + for greater; don’t use anything if you want to specify the exact size (Lm2).
        Use m for megabytes, k for kilobytes, or nothing for just bytes (notice that these letters must appear before the sign).
    The mh-1 tells the glob to show files modified in the last hour
        Use - if you want files modified within the last X units of time, and + for files modified more than X units of time ago.
        Use M for Months, w for weeks, h for hours, m for minutes, and s for seconds (notice that these leters must appear before the sign).
    The om tells the glob to sort the remaining files by their modification date.
        A lowercase o sorts by most recent first, to use the reverse order, make it uppercase O.
        Use m to sort by modification date, and L to sort by size (oL).
    The [1,3] tells the glob to show the first 3 files (since we just sorted the files, these will be the most recently modified ones).
        You can also show a single file (for example, the second one [2])

Syntax is a trade-off between terseness and obscurity. To people that are
familiar with the Zsh jargon, the ability to combine five different filters by
only typing a few characters is an awesome feature; to everybody else, it’s
incomprehensible mumbo-jumbo. Fortunately, useful shortcuts get used more
often, and they become easier to remember.

Head over to section 14.8.7 of the manual if you’d like to be showered in
details.

### Pro Tip

Here’s a cool tip for all you advanced devils (feel free to skip to section
2 if you’ve had enough file pickin’ for a day). How can we select folders that
don’t contain a given file? In the manual you’ll find information about
a qualifier called estring, which runs the code specified by the string, and
only keeps the file names that return true. For example:

``` sh
# show every continent that doesn't contain a country named malta
print -l zsh_demo/*/*(e:'[[ ! -e $REPLY/malta ]]':)
# zsh_demo/calculations/africa
# zsh_demo/calculations/asia
# zsh_demo/data/africa
# zsh_demo/data/asia
```

Let’s parse this magic:

    After the e, the string has to be delimited by a convenient character (in this case, a colon :), and the code must be surrounded by single quotes ', so the actual command is just `[[ ! -e $REPLY/malta ]]`.
    The $REPLY variable contains every file name of the ones specified by the glob `zsh_demo/*/*` in turn, but only a single file at a time.
    `[[ -e file ]]` is a conditional expression that returns true if the file exists. We want it to return true when the file called malta doesn’t exist, so we reverse it with !.
    When the code is executed, the $REPLY variable takes the value of the next file and the code is executed again.

2. Variable transformations

#### Modifiers

To complicate things even further (or to make them more awesome, depending on
your perspective), you can stick one more thing inside the parentheses at the
end of your globs: modifiers.

Each modifiers is preceded by a colon :, which makes them easily
distinguishable from qualifiers.

``` sh
# A plain old glob
print -l zsh_demo/data/europe/poland/*.txt

# Return the file name (t stands for tail)
print -l zsh_demo/data/europe/poland/*.txt(:t)

# Return the file name without the extension (r stands for remove_extension, I think)
print -l zsh_demo/data/europe/poland/*.txt(:t:r)

# Return the extension
print -l zsh_demo/data/europe/poland/*.txt(:e)

# Return the parent folder of the file (h stands for head)
print -l zsh_demo/data/europe/poland/*.txt(:h)

# Return the parent folder of the parent
print -l zsh_demo/data/europe/poland/*.txt(:h:h)

# Return the parent folder of the first file
print -l zsh_demo/data/europe/poland/*.txt([1]:h)
# Remember you can combine qualifiers and modifiers.
```

Modifiers are not only for globs, you can also use them with variables (the
technical term is parameter expansion):

``` sh
# run me, you'll like it

my_file=(zsh_demo/data/europe/poland/*.txt([1]))
# If you want to store a glob in a variable, you must use parentheses

print -l $my_file
print -l $my_file(:h)    # this is the syntax we saw before
print -l ${my_file:h}    # I find this syntax more convenient
print -l ${my_file(:h)}  # don't mix the two, or you'll get an error

print -l ${my_file:u}    # the :u modifier makes the text uppercase
```

Let’s say we wanted to calculate the maximum income for each country, and store
it in a file named {country}_max_income.txt in the corresponding calculations
folder. We can do this easily using my favorite modifier (:s):

``` sh
# run me if you like to run things

for file in zsh_demo/data/**/income.txt ; do
    output_dir=${file:h:s/data/calculations/}
    country=${output_dir:t}
    output_file="${output_dir}/${country}_max_income.txt"
    echo "The max salary is $RANDOM dollars" > $output_file
done

# let's see what we just did
grep "" zsh_demo/calculations/**/*_max_income.txt
```

Note: The grep "" bunch_of_files command is a quick-and-dirty way to show the
name of each file and its contents (we could have also used head
bunch_of_files, try it).

So, what’s going on here?

Each time the for loop runs, the $file variable is set to a different income
file: `zsh_demo/data/africa/kenya/income.txt`. We use the :h modifier to get
rid of the file name: `zsh_demo/data/africa/kenya/`, and then we use the :s
modifier to substitute data with calculations:
`zsh_demo/calculations/africa/kenya/`, then we store that substituted path in
the $output_dir variable. We use the :t modifier to get the name of the country
(kenya) and we store it in the $country variable Then we stick a slash
/ between the `$output_dir` and `$country` variables, and append
`_max_income.txt` to get our output file path:
`zsh_demo/calculations/africa/kenya/kenya_max_income.txt` The $RANDOM variable
gives you a random number every time you call it (it’s just a quick way of
generating some content). The right arrow > saves the calculation to the output
file.

A few more things about the `:s` modifier:

You can use any character to separate the `:s` and the strings:

``` sh
# run me and see for yourself

my_variable="path/abcd"
echo ${my_variable:s/bc/BC/} # path/aBCd
echo ${my_variable:s_bc_BC_} # path/aBCd

echo ${my_variable:s/\//./} # path.abcd (escaping the slash \/)
echo ${my_variable:s_/_._}  # path.abcd (slightly more readable)
# this is useful when you want to substitute the slash (/)
# without having to escape it with a backslash (\)
```

The `:s`modifier only performs one substitution, if you want to do more, use the :gs modifier (g stands for global)

``` sh
# run me just for fun

my_variable="aaa"
echo ${my_variable:s/a/A/} # Aaa
echo ${my_variable:gs/a/A/} # AAA
```

### Expansion flags

Now that you’ve learned all about glob operators, glob qualifiers, and
modifiers, let’s add one more spice to the pot: expansion flags.

``` sh
# run me, it's free

# Let's say somebody gave you these updated files
# and told you to replace the old ones
echo $RANDOM > zsh_demo/africa_malawi_population_2014.txt
echo $RANDOM > zsh_demo/asia_nepal_income_2014.txt
echo $RANDOM > zsh_demo/europe_malta_literacy_2014.txt
```

``` sh
# How would you move them to their appropriate folders?

# Try this wizardry
for file in zsh_demo/*.txt; do
    file_info=(${(s._.)file:t})
    continent=$file_info[1]
    country=$file_info[2]
    data=$file_info[3]

    mv -f $file zsh_demo/data/${continent}/${country}/${data}.txt
done
```

``` sh
# Check the contents of the files (.) modified (m) in the last
# 5 minutes (m-5) to see what you just did
grep "" zsh_demo/**/*(.mm-5)
```

Let’s tear down the example to understand what’s going on.

We are using a for loop to cycle through the new text files, and we’re storing
each file name in the $file variable.

``` sh
echo $file
# zsh_demo/europe_malta_literacy_2014.txt
```

We don’t want the whole path, so we use the :t modifier to get rid of everything to the left of the first slash /.

``` markdown
echo ${file:t}
# europe_malta_literacy_2014.txt
```

We use the (s) expansion flag to split the file name at each underscore _.

``` sh
echo ${(s._.)file:t}
# europe malta literacy 2014.txt
```

We surround everything with parentheses so we can save it into an array variable.

``` sh
file_info=${(s._.)file:t}
echo $file_info
# the parentheses are missing, file_info contains the wrong information:
# europe_malta_literacy_2014.txt

file_info=(${(s._.)file:t})
echo $file_info
# with parentheses, it works:
# europe malta literacy 2014.txt
```

We use an auxiliary variable for continent, country, and data. Since
$file_info is now an array, we can refer to its elements by using a numeric
index.

echo ${file_info[3]}
# literacy

    We use the auxiliary variables to specify the path where we want to move the new files zsh_demo/data/${continent}/${country}/${data}.txt.

There are a bunch of other flags described in the 14.3.1 section of the manual. Check them out if you’re curious. We have already covered the split expansion flag (s); the only other one I use is the join expansion flag (j), which does the opposite of the split flag.

my_array=(a b c d)
echo ${(j.-.)my_array}
# a-b-c-d

# Since we are joining using dots (.), it makes more sense to
# use underscores (_) to separate the dots and the j
echo ${(j_._)my_array}
# a.b.c.d

3. Magic tabbing
Event designators

Let’s introduce the last member of our Zsh jargon family: after glob operators and qualifiers, modifiers and expansion flags, I give you event designators.

An event designator references one of the commands that we have previously entered. They always start with a bang !:

# show the previous command
echo a b c
!! # instead of pressing <Enter>, press <Tab>, then press <Enter>

# show two commands ago
echo d e f
echo g h i
!-2 # press <Tab>, then press <Enter>

Note: If you press <Enter> instead of <Tab>, the event designator will also get replaced, but you’ll still have to press <Enter> one more time to run it.

I find that these designators are not super useful by themselves because pressing the up arrow key is all we need to do to pull up the previous command (use Control R if you get tired of pressing). When they really come in handy is to add previous arguments to our current command.

# add the last argument
ls zsh_demo/data/asia/laos/population.txt
ls -l !!1 # press <Tab>, then press <Enter>

# add all the previous arguments
echo a b c
print -l !!* # press <Tab>, then press <Enter>

So, we reference previous arguments in two steps:

    Specify which command you are interested in
        The previous command !! is the one you’ll use most often.
        If you want to go back farther, use the minus sign - and a number: !-2, !-3.
        You can also use the current command !#
    Pick what arguments you want to reuse
        To pick an argument from the previous command, just add a number !!1, !!2. Use !!$ for the last argument.
        To pick an argument from two or more commands ago, add a colon : before the number !-2:1 (because!-21 means something else).
        If you want to reference all the arguments, use an asterisk * !!* !-2:*.
        If you want skip all the arguments except the first one or two, add a number before the asterisk !!2*, !-2:2*.

Some useful examples

mv zsh_demo/data/asia/laos/population.txt !#1
# press <Tab>
# now you can easily change the second argument
# (use Control W to delete every up to the first slash)

ls zsh_demo/data/europe/malta/literacy.txt
awk '$1 > 3' !$
# press <Tab>
# !$ is a shortcut for !!$

ls zsh_demo/*/*/nepal/literacy.txt
ls zsh_demo/*/*/malta/literacy.txt
ls -l !-2:1
# press <Tab>
# now you can see the details of the nepal file

If you don’t believe there is such a thing as being too productive, check out the history expansion section of the manual for additional shortcuts.

Pressing <Tab> lets you expand not only old commands, but globs, variables (when they use the ${} syntax), and even lazily-typed paths!

ls zsh_demo/*/*/nepal/literacy.txt
# press <Tab>

my_var="1 2 3"
echo ${my_var}
# press <Tab>


ls z/d/a/l
# press <Tab>
# Mind blown!

Bonus tips

There is a ton of stuff we haven’t covered, but I can point you to other people’s awesome tips. They are all totally worth it:

    Andrew Hays encourages us to love our terminal by installing the elegant Solarized color scheme, and customizing our prompt. Follow his instructions and make all those hours in front of your terminal a more enjoyable experience.

    Danilo Petrozzi over at Zsh Wiki shares a powerful alternative to global aliases. If you find yourself typing stuff like | head | column -t | less -S at the end of your commands, check out his method to turn any sequence of characters into a convenient snippet.

    Also at Zsh Wiki, learn about a way to rename multiple files by using the zmv command. It’s extremely convenient for replacing spaces with underscores, changing file extensions, and renaming files located in a nested folder structure. Always run zmv using the -n option once, so you are know what the command will actually do.

    We used brace expansion multiple times in this tutorial, but we didn’t cover all of its features. Tomasz Muras wrote a nice post about it.

    I wasn’t able to find a blog post explaining associative arrays, but I’ve found them incredibly useful to deal with sets of parameters. If there’s interest, I might go into them in a future post.

Parting thoughts

I’ve you read this entire thing in one sitting your brain is probably melting. Don’t fret about remembering every little detail. What’s important is to realize that there are easy ways of doing a lot of things that you didn’t know could be done, and recalling where to go for additional information.

I have a file where I keep all my Zsh snippets. Every time I have to look up the syntax for a command, I open up the file and I write it down. I recommend you do the same. It’s the act of progressively improving this file that will help you achieve mastery.

Feel free to leave a comment if you’d like to share a tip.
