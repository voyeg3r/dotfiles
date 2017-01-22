#!/usr/bin/python
r"""
PYTHONRC
========
Initialization script for the interactive Python interpreter. Its main purpose
is to enhance the overall user experience when working in such an environment
by adding some niceties to the standard console.

It also works with IPython and BPython, although its utility in that kind of
scenarios can be argued.

Tested in GNU/Linux with Python versions 2.7 and 3.4.

Please read the Installation section below.


Features
--------
- User input completion
    + Introduces a completion mechanism for inputted commands in Python 2.
    + In Python 3, where the standard console is a lot nicer, it just
    impersonates the default completion machinery to keep the consistency with
    the behavior in Python 2 (and so it's still possible to adapt it to the
    user's needs).

- Command History
    + Creates a callable, singleton object called `history`, placing it into
    the `__builtins__` object to make it easily available, which enables the
    handling of the command history (saving some input lines to a file of your
    choice, listing the commands introduced so far, etc.). Try simply
    `history()` on the Python prompt to see it in action; inspect its members
    (with `dir(history)` or `help(history.write)`) for more information.

- Color prompt
    + Puts a colorful prompt in place, if the terminal supports it.


Installation
------------
- You must define in your environment (in GNU/Linux and MacOS X that usually
means your `~/.bashrc` file) the variable 'PYTHONSTARTUP' containing the path
to `pythonrc.py`.

- It is also highly recommended to define the variable 'PYTHON_HISTORY_FILE'.
Remember that BPython (unlike the standard interpreter or IPython) ignores that
variable, so you'll have to configure it as well by other means to be able to
use the same history file there (for instance, in Linux, the file
`~/.config/bpython/config` is a good place to start, but please read BPython's
documentation).

### Example configurations
- Extract of `~/.bashrc`
```sh
# python
export PYTHONSTARTUP=~/.python/pythonrc.py
export PYTHON_HISTORY_FILE=~/.python/.python_history

## You may want to also uncomment some of this lines if using virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4
# export WORKON_HOME=~/.python/virtualenvs
# source $(which virtualenvwrapper.sh)
```

- Extract of `~/.config/bpython/config`
```
[general]
color_scheme = default
hist_file = ~/.python/.python_history
hist_lenght = 1000
```

Bugs / Caveats / Future enhancements
------------------------------------
- No module/package introspection for the last argument in commands of the form
`from <package> import <not_completing_this>` (this, in fact, could be a not so
bad thing, because it doesn't execute side effects, e.g. modules' init code).

- Depending on the user's system, the compilation of the packages' and modules'
list for completing `import ...` and `from ... import ...` commands can take a
long time, especially the first time it is invoked.

- When completing things like a method's name, the default is to also include
the closing parenthesis along with the opening one, but the cursor is placed
after it no matter what, instead of between them. This is because of the
python module `readline`'s limitations.
You can turn off the inclusion of the closing parenthesis; if you do so, you
might be also interested in modifying the variable called
`dict_keywords_postfix` (especially the strings that act as that dictionary's
indexes).

- IPython has its own `%history` magic. I did my best to not interfere with
it, but I don't know the actual consequences. Also, it's debatable if it
even makes sense to use this file with IPython and/or BPython (though having
a unified history for all the environments is really nice).
You could define some bash aliases like
```sh
alias ipython='PYTHONSTARTUP="" ipython'
alias bpython='PYTHONSTARTUP="" bpython'
```
to be on the safer side.

- Could have used the module `six` for better clarity. Right now it uses my own
made up stubs to work on both Python 2 and 3.

- Needs better comments and documentation, especially the part on history
handling.

- Probably a lot more. Feel free to file bug reports ;-)
"""


def init():
    # color prompt
    import sys
    import os

    term_with_colors = ['xterm', 'xterm-color', 'xterm-256color', 'linux',
                        'screen', 'screen-256color', 'screen-bce']
    if os.environ.get('TERM') in term_with_colors:
        escapes_pattern = '\001\033[%sm\002'  # \001 and \002 mark non-printing
        red = escapes_pattern % '31'
        green = escapes_pattern % '32'
        reset = escapes_pattern % '0'
        sys.ps1 = red + '>>> ' + reset
        sys.ps2 = green + '... ' + reset

    # readline (tab-completion, history)
    try:
        import readline
    except ImportError:
        print("Module 'readline' not available. Skipping user customizations.")
        return
    import rlcompleter
    import atexit
    from pwd import getpwall
    from os.path import isfile, isdir, expanduser, \
        join as joinpath, split as splitpath, sep as pathsep

    default_history_file = '~/.pythonhist'
    majver = sys.version_info[0]

    # Both BPython and Django shell change the nature of the __builtins__
    # object. This hack workarounds that:
    def builtin_setattr(attr, value):
        if hasattr(__builtins__, '__dict__'):
            setattr(__builtins__, attr, value)
        else:
            __builtins__[attr] = value

    def builtin_getattr(attr):
        if hasattr(__builtins__, '__dict__'):
            return getattr(__builtins__, attr)
        else:
            return __builtins__[attr]

    # My own "six" library, where I define the following stubs:
    # * myrange for xrange() (python2) / range() (python3)
    # * exec_stub for exec()
    # * iteritems for dict.iteritems() (python2) / list(dict.items()) (python3)
    # I could have done "from six import iteritems" and such instead of this
    if majver == 2:
        myrange = xrange

        def exec_stub(textcode, globalz=None, localz=None):
            # the parenthesis make it valid python3 syntax, do nothing at all
            exec (textcode) in globalz, localz

        def iteritems(d):
            return d.iteritems()

    elif majver == 3:
        myrange = range
        # def exec_stub(textcode, globalz=None, localz=None):
        #     # the "in" & "," make it valid python2 syntax, do nothing useful
        #     exec(textcode, globalz, localz) in globalz #, localz
        # the three previous lines work, but this is better
        exec_stub = builtin_getattr('exec')

        def iteritems(d):
            return list(d.items())

    # AUXILIARY CLASSES

    # History management
    class History:
        set_length = readline.set_history_length
        get_length = readline.get_history_length
        get_current_length = readline.get_current_history_length
        get_item = readline.get_history_item
        write = readline.write_history_file

        def __init__(self, path=default_history_file, length=500):
            self.path = path
            self.reload(path)
            self.set_length(length)

        def __exit__(self):
            print("Saving history (%s)..." % self.path)
            self.write(expanduser(self.path))

        def __repr__(self):
            """print out current history information"""
            # length = self.get_current_length()
            # command = self.get_item(length)
            # if command == 'history':
            #     return "\n".join(self.get_item(i)
            #                      for i in myrange(1, length+1))
            # else:
            #     return '<%s instance>' % str(self.__class__)
            return '<%s instance>' % str(self.__class__)

        def __call__(self, pos=None, end=None):
            """print out current history information with line number"""
            if not pos:
                pos = 1
            elif not end:
                end = pos
            for i, item in self.iterator(pos, end, enumerate_it=True):
                print('%i:\t%s' % (i, item))

        def iterator(self, pos, end, enumerate_it=False):
            length = self.get_current_length()
            if not pos:
                pos = 1
            if not end:
                end = length
            pos = min(pos, length)
            if pos < 0:
                pos = max(1, pos + length + 1)
            end = min(end, length)
            if end < 0:
                end = max(1, end + length + 1)
            if enumerate_it:
                return ((i, self.get_item(i)) for i in myrange(pos, end + 1))
            else:
                return (self.get_item(i) for i in myrange(pos, end + 1))

        def reload(self, path=""):
            """clear the current history and reload it from saved"""
            readline.clear_history()
            if isfile(path):
                self.path = path
            readline.read_history_file(expanduser(self.path))

        def save(self, filename, pos=None, end=None):
            """write history number from pos to end into filename file"""
            with open(filename, 'w') as f:
                for item in self.iterator(pos, end):
                    f.write(item)
                    f.write('\n')

        def execute(self, pos, end=None):
            """execute history number from pos to end"""
            if not end:
                end = pos
            commands = []
            for item in self.iterator(pos, end):
                commands.append(item)
                readline.add_history(item)
            exec_stub("\n".join(commands), globals())
            # comment the previous two lines and uncomment those below
            # if you prefer to re-add to history just the commands that
            # executed without problems
            # try:
            #     exec_stub("\n".join(commands), globals())
            # except:
            #     raise
            # else:
            #     for item in commands:
            #         readline.add_history(cmdlist)

    # Activate completion and make it smarter
    class Irlcompleter(rlcompleter.Completer):

        """
        This class enables the insertion of "indentation" if there's no text
        for completion.

        The default "indentation" is four spaces. You can initialize with '\t'
        as the tab if you wish to use a genuine tab.

        Also, compared to the default rlcompleter, this one performs some
        additional useful things, like file completion for string constants
        and addition of some decorations to keywords (namely, closing
        parenthesis, and whatever you've defined in dict_keywords_postfix --
        spaces, colons, etc.)
        """

        def __init__(
            self,
            indent_str='    ',
            delims=readline.get_completer_delims(),
            binds=('tab: complete', ),
            dict_keywords_postfix={" ": ["import", "from"], },
            add_closing_parenthesis=True
        ):
            rlcompleter.Completer.__init__(self, namespace=globals())
            readline.set_completer_delims(delims)
            self.indent_str_list = [indent_str, None]
            for bind in binds:
                readline.parse_and_bind(bind)
            self.dict_keywords_postfix = dict_keywords_postfix
            self.add_closing_parenthesis = add_closing_parenthesis

        def complete(self, text, state):
            line = readline.get_line_buffer()
            stripped_line = line.lstrip()
            # libraries
            if stripped_line.startswith('import '):
                value = self.complete_libs(text, state)
            elif stripped_line.startswith('from '):
                pos = readline.get_begidx()
                # end = readline.get_endidx()
                if line[:pos].strip() == 'from':
                    value = self.complete_libs(text, state) + " "
                elif state == 0 and line.find(' import ') == -1:
                    value = 'import '
                else:
                    # Here we could do module introspection (ugh)
                    value = None
            # indentation, files and keywords/identifiers
            elif text == '':
                value = self.indent_str_list[state]
            elif text[0] in ('"', "'"):
                value = self.complete_files(text, state)
            else:
                value = self.complete_keywords(text, state)
            return value

        def complete_keywords(self, text, state):
            txt = rlcompleter.Completer.complete(self, text, state)
            if txt is None:
                return None
            if txt.endswith('('):
                if self.add_closing_parenthesis:
                    return txt + ')'
                else:
                    return txt
            for postfix, words in iteritems(self.dict_keywords_postfix):
                if txt in words:
                    return txt + postfix
            return txt

        def complete_files(self, text, state):
            str_delim = text[0]
            path = text[1:]

            if path.startswith("~/"):
                path = expanduser("~/") + path[2:]

            elif path.startswith("~"):
                i = path.find(pathsep)
                if i > 0:
                    path = expanduser(path[:i]) + path[i:]
                else:
                    return [
                        str_delim + "~" + i[0] + pathsep
                        for i in getpwall()
                        if i[0].startswith(path[1:])
                        ][state]

            dir, fname = splitpath(path)
            if not dir:
                dir = os.curdir
            return [
                str_delim + joinpath(dir, i)
                for i in os.listdir(dir)
                if i.startswith(fname)
                ][state]

        def complete_libs(self, text, state):
            libs = {}
            for i in sys.path:
                try:
                    if i == '':
                        i = os.curdir
                    files = os.listdir(i)
                    for j in files:
                        filename = joinpath(i, j)
                        if isfile(filename):
                            for s in [".py", ".pyc", ".so"]:
                                if j.endswith(s):
                                    j = j[:-len(s)]
                                    pos = j.find(".")
                                    if pos > 0:
                                        j = j[:pos]
                                    libs[j] = None
                                    break
                        elif isdir(filename):
                            for s in ["__init__.py", "__init__.pyc"]:
                                if isfile(joinpath(filename, s)):
                                    libs[j] = None
                except OSError:
                    pass
            for j in sys.builtin_module_names:
                libs[j] = None
            libs = sorted(j for j in libs.keys() if j.startswith(text))
            return libs[state]

    # DEFINITIONS:

    # history file path and length
    history_length = 1000
    history_path = os.getenv("PYTHON_HISTORY_FILE", default_history_file)

    # bindings for readline (assign completion key, etc.)
    # readline_binds = (
    #     'tab: tab_complete',
    #     '"\C-o": operate-and-get-next',  # exists in bash but not in readline
    #     )
    # completion delimiters
    # we erase ", ', ~ and / so file completion works
    # readline_delims = ' \t\n`!@#$%^&*()-=+[{]}\\|;:,<>?'
    readline_delims = readline.get_completer_delims()\
        .replace("~", "", 1)\
        .replace("/", "", 1)\
        .replace("'", "", 1)\
        .replace('"', '', 1)
    # dictionary of keywords to be postfixed by a string
    dict_keywords_postfix = {
        ":": ["else", "try", "finally", ],
        " ": ["import", "from", "or", "and", "not", "if", "elif", ],
        " ():": ["def", ]  # "class", ]
        }

    # DO IT

    completer = Irlcompleter(delims=readline_delims,  # binds=readline_binds,
                             dict_keywords_postfix=dict_keywords_postfix)
    readline.set_completer(completer.complete)
    history = History(history_path, history_length)
    builtin_setattr('history', history)
    atexit.register(history.__exit__)

# run the initialization and clean up the environment
init()
del init
