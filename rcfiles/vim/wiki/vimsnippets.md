# O plugin [UltiSnips md](UltiSnips.md)

``` markdown
File:		 VimSnippets.md
Created:	 ter 10 jan 2017 14:41:26 BRT
Last Change: ter 10 jan 2017 14:41:26 BRT
Author:		 Sergio Araujo
Site:		 http://vivaotux.blogspot.com
e-mail:      <voyeg3r ✉ gmail.com>
Twitter:	 @voyeg3r
Github:      https://github.com/voyeg3r
```


#### Diretorio dos snippets (dá uma olhada em help Ulti...)

    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

[[Tex.Snippets]]


### como apagar tags do tipo </font*> no vim

    <\/\?font[^<]*>

A expressão regular acima apaga a tag <font*> ou </font*>
de documentos quaisquer, o asterisco representa qualquer caractere
no intervalo entre 'font' e o fechamento da tag

Explicando:

    < .................. abertura 'literal' da tag
    \ .................. escape para a barra
    / .................. no caso de tag de fechamento tip </font*>
    \? ................. quantificador (no caso zero ou mais)
    font ............... palavra font literal

     EXPLICAÇÃO PARA O GRUPO  ---->  [^<]*

    [ .................. abertura de um grupo
    ^ .................. se aparece no começo do grupo nega tudo que nele aparece
    < .................. no caso estamos negando a abertura de tag
    ] .................. fechamento do grupo
    * .................. quantificador para o grupo (zero ou mais)


		%s,</\?font[^<]*>,,g

Para evitar usar muitos escapes usamos no comando final (acima) um delimitador
de busca diferente, para não ter que escapar todas asa barras, havendo somente
um escape para \? que é o quantificador da barra nornal, significa uma barra
normal no começo ou não (zero ou 1 ocorrências)

