### Introdução

Por padrão o cliente Subversion só irá pedir senha durante a primeira conexão com o servidor Subversion, pois o cliente do Subversion irá armazenar a senha e outras informações de autenticação em ~/.subversion/auth. Isto cria possíveis pontos de exploração do servidor Subversion, para mudar isto edite o arquivo em ~/.subversion/config e altere a seguinte linha de:

store-passwords = yes

Para:

store-passwords = no

### criando um repositório

  svn create <caminho_do_diretorio>


### Find out who change what files in a SVN repository
descubra o que mudou em um repositório svn

svn log -v | less


### verificando diferenças com cores habilitadas

svn diff | view -


### Observações

trunk=versão atual
branchs=versões de testes
tags=releses
$svn import   .   file:///home/diego/repositorio/sitePessoal/trunk/


Quando for preciso efetuar modificações em um
projeto que já está no svn, antes é preciso
fazer o checkout, ou seja, efetuar o download
dos arquivos correspondentes ao projeto.


  svn co repositorio

Esta etapa só é necessária ser executada uma vez.
Obs: checkout = comit

### copiando algo para o repositório
um trem qualquer

   svn add trem


### Efetivando alterações

  svn commit file:///home/diego/repositorio/sitePessoal/trunk/

Obs: comit = ci

### exemplos

# svn st

Legenda:

    * U - o arquivo foi "Updated" (atualizado) a partir do servidor;
    * A - o arquivo ou diretório foi "Added" (adicionado) à sua working copy;
    * D - o arquivo ou diretório foi "Deleted" (deletado) da sua working copy;
    * R - o arquivo ou diretório foi "Replaced" (substituído) em sua working copy, ou seja, um elemento foi deletado e posteriormente outro com o mesmo nome foi adicionado; embora tenham o mesmo nome o repositório consegue percebê-los como arquivos diferentes;
    * G - o arquivo no servidor recebeu alterações, mas sua cópia local tinha as suas modificações; ou as alterações não interceptavam ou eram idênticas às suas, então o Subversion conseguiu colocá-las em estado de "merGed" (união) sem problemas;
    * C - o arquivo recebeu alterações "Conflicting" (conflitantes) com as suas, ou seja, na mesma seção do arquivo; trataremos deste caso mais adiante.



$ svn checkout http://svn.example.com/repos/calc
A    calc/Makefile
A    calc/integer.c
A    calc/button.c
Checked out revision 56.

A letra 'A' indica arquivos adicionados ao repositório local
A letra 'U' indica atualização

Fazendo commit de um arquivo apenas
$ svn commit button.c -m "Fixed a typo in button.c."
Sending        button.c
Transmitting file data .
Committed revision 57.

$ svn update
U  foo.c
U  bar.c
Updated to revision 2.

U .... update (arquivos modificados no repositório)

svn status
A       stuff/loot/bloo.h   # arquivo agendado para adição
C       stuff/loot/lump.c   # arquivo em conflito a partir de um update
D       stuff/fish.c        # arquivo agendado para exclusão
M       bar.c               # conteúdo em bar.c tem alterações locais

Nenhuma  das  execuções  anteriores  de  svn  status  contactam  o  repositório—ao  invés  disso,  elas
comparam os metadados no diretório .svn com a cópia de trabalho. Finalmente, existe a opção --
show-updates (-u), que se conecta ao repositório e adiciona informação sobre as coisas que estão
desatualizadas:
$ svn status -u -v
M      *        44        23    sally     README
M               44        20    harry     bar.c
       *        44        35    harry     stuff/trout.c
D               44        19    ira       stuff/fish.c
A                0         ?     ?        stuff/things/bloo.h
Status against revision:   46




### como baixar o tema de ícones oxygen

svn co svn://anonsvn.kde.org/home/kde/trunk/playground/artwork/Oxygen/


### Entrevista com um dos criadores do tema de ícones oxygen (kde)
* http://caio.ueberalles.net/log/2006/06/11/entrevista-kde-artists/

### Comandos básicos
||Comando||Atalhos||Ação||Exemplo||
||checkout||co||Faz um download do repositório e cria uma cópia de trabalho||svn co !http://svn.collab.net/repos||
||status||st||Mostra alterações da cópia de trabalho||svn status||
||commit||ci||Envia alterações da cópia de trabalho pro servidor||svn commit -m “Informação sobre commit”||
||add|| ||Adiciona novos arquivos ao repositório||svn add foo.c||
||delete||del, remove ou rm||Remove arquivos do repositório||svn del foo.c||
||revert|| ||volta arquivo da cópia de trabalho para ultima versão baixada do repositório||svn revert -R .||
||update||up||Atualiza para ultima versão do repositório||svn update||
||help|| ||Mostra ajuda||svn help||

### Outros comandos
||Comando||Atalhos||Ação||Exemplo||
||export|| ||faz download do repositório sem versionar a cópia||svn export !svn://svn.svn.org .||
||copy||cp||copia um diretório/arquivo do repositório||svn cp !svn://expresso/trunk !svn://expresso/delivery/new/ ||
||move||mv||move um diretório/arquivo do repositório|| ||
||info|| ||mostra informação sobre repositório||svn info||
||diff|| ||mostra um diff||svn diff -r15:40||
||list|| ||lista os arquivos no repositório||svn list !svn://svn.svn.org/trunk/src||
||propset, propdel|| ||muda propriedade de um arquivo||svn propset svn:executable 1 binaryfile||

### Referências
* http://vainalousachefe.wordpress.com/2008/02/21/introducao-ao-controle-de-versao-local-com-git/ sobre o git
* http://malcomtux.blogspot.com/2007/08/servidor-subversion-no-windows-xp.html
* http://techbase.kde.org/Getting_Started/Sources/Anonymous_SVN_(pt_BR)
* http://www.leoserra.uaivip.com.br/leonix/documentacao/subversion-usando.html
* http://www.expressolivre.org/dev/wiki/svn/uso?format=txt
* http://www.leoserra.uaivip.com.br/leonix/documentacao/subversion-apache2.html
* http://www.dicas-l.com.br/dicas-l/20050909.php
