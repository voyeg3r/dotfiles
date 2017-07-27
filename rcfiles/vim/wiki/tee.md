# O Comando tee
+ http://www.uniriotec.br/~morganna/guia/tee.html

Exibe a saíde de um comando e o envia para o pipe

O tee pega a entrada padrao, joga em um arquivo e ainda envia novamente para a saida padrao.
No teu caso, tudo que for digitado sera salvo NOS DOIS ARQUIVOS e a saida padrão enterrada no /dev/null

    tee [opções] [arquivo]

    O argumento arquivo é o nome do arquivo de saída onde os dados de entrada
    serão gravados (além de serem também exibidos na saída padrão).


### Descrição

Este utilitário ler dados na entrada padrão e os grava na saída padrão e em arquivos.
Algumas opções do comando

    -a : adiciona a entrada padrão no final do arquivo especificado.
    -i : ignora os sinais de interrupção.
    --help : exibe as opções do utilitário.
    --version : mostra informações sobre o utilitário.

### Exemplos

    O comando

        tee teste.txt

    faz com que toda entrada digitada pelo usuário seja ecoada na tela e
    gravada no arquivo teste.txt.  Para acrescentar os novos dados de entrada
    no final do arquivo teste.txt, sem perder as informações que este arquivo
    já possui, digite

        tee -a teste.txt

    É possível usar o PIPE (representado pelo símbolo |) para redirecionar a
    saída de algum comando para o tee. Por exemplo,

        cat teste.txt | tee teste2.txt

    exibe o conteúdo do arquivo teste.txt na tela além de copiá-lo para o
    arquivo teste2.txt (para saber mais sobre o PIPE, veja redirecionadores de
    E/S).

### Observações

    Caso o nome de um arquivo não seja definido junto com o comando tee, o
    sistema exibirá os dados apenas na saída padrão.

### Tópicos relacionados

    cat - concatena e/ou exibe um ou mais arquivos.
    redirecionadores de E/S - >, >>, < e |.

