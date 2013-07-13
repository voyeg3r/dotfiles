#!/usr/bin/env python
# # -*- coding: UTF-8 -*-
# Criado em:Sáb 06/Mar/2010 hs 08:09
# Last Change: 2012 Out 07 08:15:43
# vim:ft=python:nolist:nu:
# Instituicao: cpqt
# Proposito do script: apihelper - acesso à documentação dos módulos
# Autor: Sérgio Luiz Araújo Silva
# site: http://vivaotux.blogspot.com

# Este código foi copiado do livro "Mergulhando no Python",
# o original em inglês chama-se "Dive in python"
# o código abaixo pode ser visto na página 31 da versão em português

def info(object, spacing=10, collapse=1):
    """Exibe métodos e doc strings,
    usa módulos, classes, listas, dicionários ou strings."""
    methodList = [ method for method in dir(object) if callable(getattr(object, method)) ]
    processFunc = collapse and (lambda s: " ".join(s.split())) or (lambda s: s)
    print "\n".join(["%s %s" % (method.ljust(spacing),
                                processFunc(str(getattr(object, method).__doc__))) for method in methodList])

    if __name__ == "__main__":
        print info.__doc__

