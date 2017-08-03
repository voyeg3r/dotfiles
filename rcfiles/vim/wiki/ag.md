# Recursively search for PATTERN in PATH. Like grep or ack, but faster.

      ag [file-type] [options] PATTERN [PATH]

Considering the above example you can see that the only thing
that you must use when using 'ag' command is its own name and
one pattern to find, because always you have brackets options
between brackets this means that you can ignore things between
them

In my case I've tried to use 'ag' as search tool for ctrlp
plugin in vim and always it seems to find mp3 files and I am
trying to use .agignore file

### localizar links markdown sem extensão ".md"

O uso da opção `-l` do ag faz ele exibier somente os nomes

    ``` ag
    ag -l '\[[^]]*\]\([^):.]*\)' .
    ```
