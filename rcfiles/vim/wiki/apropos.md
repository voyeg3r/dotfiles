### from dicas-l

Uma facilidade bastante interessante existente em sistemas Unix é o comando
apropos. Este comando consulta um banco de dados consistindo da descrição do
comando. É bastante útil em situações em que se deseja executar determinada
tarefa e não se conhece o nome do comando. Por exemplo, caso eu queira
descobrir obter informação a respeito de compiladores instalados em meu
sistema, eu poderia digitar:

    apropos compiler

Uma vez de posse desta informação eu digitaria então

      % man gcc


para obter informações específicas sobre o compilador gcc.  Todavia, este banco
de dados não é criado automaticamente. O administrador de sistemas precisa
criar este banco de dados através do comando catman. Este comando irá varrer
todos os diretórios especificados na variável de ambiente MANPATH e irá
construir um arquivo chamado "whatis", onde irá colocar as descrições dos
programas. Caso não exista este arquivo, ao se invocar o comando apropos uma
mensagem parecida com a mensagem abaixo será exibida:

``` sh
% apropos compiler
apropos: file /usr/local/man/whatis not found
          Create the whatis database using the catman -w command.
```

Para construir este banco de dados emitir o comando

      catman -w

Uma vez criado o banco de dados o comando apropos (ou man -k) poderá então ser
utilizado.

### comandos de rede no linux

apropos network | less
