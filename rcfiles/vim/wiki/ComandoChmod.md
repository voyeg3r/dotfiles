###Introdução

    File:		 ComandoChmod.md
    Created:	 dom 08 jan 2017 11:54:36 BRT
    Last Change: dom 08 jan 2017 11:56:24 BRT
    Author:		 Sergio Araujo
    Site:		 http://vivaotux.blogspot.com
    e-mail:      <voyeg3r ✉ gmail.com>
    Twitter:	 @voyeg3r
    Github:      https://github.com/voyeg3r


### comando para atribuir permissões no linux

      chmod u+x arquivo.txt

dá permissão de execução ao arquivo x

###aplicar as mesmas permissões a outro arquivo

     chmod --reference file1 file2

###aplicar permissões somente a arquivos

		chmod 644 $(find . -type f)

### quando houver arquivos com espaço no nome

		find . -type f -print0 2>/dev/null |xargs -0 -I'{}' chmod 644 '{}'

###aplicar permissões somente a diretórios

		chmod 755 $(find . -type d)

     chmod 644 $(find . -type f)

#### quando houver arquivos com espaço no nome

     find . -type f -print0 2>/dev/null |xargs -0 -I'{}' chmod 644 '{}'

####aplicar permissões somente a diretórios

     chmod 755 $(find . -type d)
    
