### Mostrando as diferenças entre duas árvores de diretórios

diff <(cd dir1 && find | sort) <(cd dir2 && find | sort)

Outro modo de fazer o mesmo

diff -urp /originaldirectory /modifieddirectory


diff -Naur dir1/ dir2/

    The -u option makes the output a little easier to read.
    The -r option recurses through all subdirectories
    The -N and -a options are really only necessary if you wanted to create a patch file.

### comparando o conteúdo de duas variáveis

diff <(echo "$a") <(echo "$b")

# diferenças entre dois comandos
diff <(tail -10 file1) <(tail -10 file2)

### guardando as diferenças entre dois arquivos

diff frutas1.txt frutas2.txt > diferenca.001.patch

### aplicando as diferenças "patch"

patch frutas1.txt < diferenca.001.patch

### Referências
* http://www.commandlinefu.com/commands/browse
* http://leonardobighi.com/linux/31/usando-diff-e-patch-pra-agilizar-seu-trabalho

