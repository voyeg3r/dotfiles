# link oficial
[github repo](https://github.com/SirVer/ultisnips)

``` markdown
File:		 UltiSnips.md
Created:	 ter 10 jan 2017 13:08:25 BRT
Last Change: ter 10 jan 2017 13:08:30 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```

### argigos a respeito:
* [sharpen your vim with snippets](https://brigade.engineering/sharpen-your-vim-with-snippets-767b693886db#.qq0y0kthk)
* [generic html snippets](https://medium.com/@shxfee/generic-html-snippets-with-vim-and-ultisnips-8cc369390cb9#.rheutidju)
* [why snippets](http://fueledbylemons.com/blog/2011/07/27/why-ultisnips/)
* [d-snippets](https://github.com/kiith-sa/DSnips)

### Inserir texto com underline usando ultisnips

``` markdown
snippet '\bul(ine)?' "underline" r
${1:your text here}
`!p snip.rv = len(t[1])*'-'`
endsnippet
```

###  Para mostrar uma lista das complementações possíveis

pressione no modo insert

		Ctrl-Tab

### Para editar snippets use o comandos

       :UltisnipsEdit

### Para definir um snippet novo digite

       snip<tab>

### Para expandir um snip digite

      palavra<tab>

### Para pular para o próximo snippet

      Ctrl-j

### Para voltar para o snippet anterior

      Ctrl-k

### Conditional replacements

One feature that I didn't mention in the screencast are conditional
replacements. When you capture a group in the search part of a
replacement, you can check if it was matched in the replacement like
so: (?<number>:yes text:no text). yes text will be inserted if the
group was matched, otherwise no text will be inserted. A quick
example:

``` markdown
snippet cond
${1:some_text}${1/(o)|(t)|..*/(?1:ne)(?2:wo)/}
endsnippet
```

The transformation will match a o at the beginning into group 1 or a t
at the beginning in group 2. The rest of the search string just
matches everything of the first tabstop. The replacement will either
be ne when a o was matched, wo when a t was matched or an empty
string. That means that you can just type a t to quickly get two as
the complete content of the snippet or a o to get one. If you type
anything else, you only get the content of the place holder, i.e. the
verbatim of what you typed.

###  how could add literal string in vim snippet?
[source here:](http://stackoverflow.com/q/15017031/)

``` markdown
snippet code
    `repeat(nr2char(96),3)` ${1:markdown}

    `repeat(nr2char(96),3)`
```


