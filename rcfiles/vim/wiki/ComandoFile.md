### Introdução
contar quantos arquivos txt há na pasta.
Na verdade um arquivo de texto pode não ter nenhuma
extensão, como saber seu tipo então?

file * | grep ASCII | wc -l

A opão '-i' força a exibição do tipo mime

    file -bi

    a opção -b exibe uma informação breve

Um erro que pode acontecer é que arquivos de texto
plano podem ser 'ASCII' assim como 'UTF-8 Unicode text'
para pegar ambos você usa o parâmetro -i do file
o que vai te dar o mime-type de cada arquivo
com o grep você deve pegar 'text/plain' e assim entregar ao
querido wc que fará a contagem para você.

file -i * | grep 'text/plain' | wc -l
file -i * | grep -c 'text/plain'

### Editar todos os arquivos de texto excluindo binários

gedit $(file * | grep text | sed 's/:.*//')

