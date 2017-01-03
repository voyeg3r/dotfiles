##Introdução
comando para atribuir permissões no linux

  chmod u+x arquivo.txt

dá permissão de execução ao arquivo x
##aplicar as mesmas permissões a outro arquivo

 chmod --reference file1 file2

##aplicar permissões somente a arquivos

<<<<<<< HEAD
		chmod 644 $(find . -type f)

# quando houver arquivos com espaço no nome
		find . -type f -print0 2>/dev/null |xargs -0 -I'{}' chmod 644 '{}'

##aplicar permissões somente a diretórios

		chmod 755 $(find . -type d)
=======
 chmod 644 $(find . -type f)
# quando houver arquivos com espaço no nome
 find . -type f -print0 2>/dev/null |xargs -0 -I'{}' chmod 644 '{}'

##aplicar permissões somente a diretórios

 chmod 755 $(find . -type d)
>>>>>>> a498acff9af22c61311c05a937d7aa3dc01dd6a3
