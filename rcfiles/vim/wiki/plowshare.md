### introduction

# command-line downloader and uploader for rapidshare, mediafire and other
# file sharing websites.
# site: https://github.com/mcrapet/plowshare

### references:
# http://blog.gypsydave5.com/2016/02/04/xargs-and-curl/

    # instalation

        yaourt -S plowshare && plowmod --install
        sudo pacman -S parallel curl

        plowdown -m [[https://www.mediafire.com/folder/5s35ib7577f0y/wallpapers|shared-wallpapers]]

        $ cat file-with-list-of-urls.txt | parallel curl -L {} -o {/}

    which passes the original URL to the {} and then removes the
    path from it with the {/}. There's plenty more you can do with
    parallels - take a look at the tutorial.

    No meu caso eu tive que manipular a lista de arquivos
    com o vim e depois rodar um comando do curl

        $ nohup cat filelist | xargs -n4 curl -L &>output &

    nohup protects the process from being interrupted by the
    session closing. So it'll keep on going even when you close
    your terminal or SSH connection. Don't worry, you can still
    kill it if you've made a mistake.

