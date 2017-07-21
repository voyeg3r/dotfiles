Arquivo: manual do comando xclip
Criado: Sex 30/Set/2011 hs 21:37
Last Change: 2011 Set 30 21:38:41
autor: Sérgio Luiz Araújo Silva
site: http://vivaotux.blogspot.com
twitter: http://www.twitter.com/voyeg3r
email: <voyeg3r  gmail.com>

# coloque este alias no seu ~/.bashrc

	alias xclip='xclip -selection c'

Agora pode fazer algo do tipo

	ls -1 | xclip
    # ... e colar no navegador e outros programas

    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'

### Tip on using above aliases
 If you want to paste on your terminal a long string you can do something like this:

    vlc $(pbpaste)

instead of worrying about using middle mouse button or even keyboard shortcuts


