Python e o caminho do meio

source: http://blog.ramgarlic.com/2009/04/python-e-o-caminho-do-meio.html
Monday, April 13, 2009

A maneira como Python trata variáveis faz muito sentido, e exemplifica uma
característica que eu gosto muito na linguagem: a opção pelo caminho do meio.

A maioria das linguagens segue um de dois caminhos extremos no tratamento de
variáveis.

Um dos caminhos é aquele que exige que cada variável seja declarada, como
ocorre em C, Pascal, Java etc. O curioso é que várias linguagens obrigam o
programador a declarar uma variável, mas nem todas elas obrigam o programador a
inicializar a variável antes de usá-la, o que gera bugs que às vezes são
difíceis de achar.

Ou seja, tornar obrigatória a declaração da variável é algo que facilita a vida
do compilador, mas não necessariamente resolve o problema do programador. Claro
que os compiladores modernos reclamam quando encontram variáveis que nunca
foram inicializadas em expressões, mas isso é um remendo.

O outro caminho, radical na direção oposta, é o das linguagens que não
obrigam a declaração da variável e nem a sua inicialização. É uma tentativa
equivocada de simplificar a vida do programador. Linguagens que seguem essa
linha são javascript, php, perl, basic e outras chamadas "linguagens de
scripting". em algumas delas (perl, visualbasic) você pode mandar o
interpretador reclamar quando encontra uma variável não declarada, mas esta
opção não costuma ser o default. Em alguns casos a variável não
inicializada tem um valor especial como "undefined" ou "null".

Nestas linguagens, a ocorrência de uma variável não inicializada em uma
expressão geralmente faz com que ela seja avaliada com algum valor default,
tipo 0 (zero) se for uma expressão numérica ou "" (string vazia) etc. Tudo
isso faz com que ocorram bugs muito chatos de encontrar, porque se o nome
de uma variável é soletrado incorretamente, o programador não é avisado e
um valor sem sentido é introduzido no programa. Em projetos grandes, isso
se torna um problema muito grave, e é um dos motivos pelos quais os adeptos
de abordagens mais rigorosas consideram que as linguagens de scripting não
são "sérias".

Python escolheu o caminho do meio, o mais sensato na minha opinião. Não é
preciso declarar variáveis, até porque tal declaração não teria muita
utilidade em uma linguagem de tipagem dinâmica onde o tipo está vinculado
ao objeto, e não à variável. Mas Python exige que você inicialize uma
variável antes de usá-la. Veja:

>>> b = a + 1
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
NameError: name 'a' is not defined



Então isso obriga você a escrever:

>>> a = 3
>>> b = a + 1
>>> print a, b
3 4



Note que como toda variável precisa obrigatoriamente ser inicializada,
isso é mais útil do que a exigência de que ela seja simplesmente
declarada. Porque evita valores inválidos, e o momento da atribuição acaba
funcionando como uma declaração também.

O modo como Python lida com identificadores, não só neste aspecto, mas
também no seu sofisticado sistema de namespaces, evita conflitos de nomes
e é um dos fatores que torna Python atraente para projetos de larga
escala. Ruby adota a mesma filosofia de Python quanto à inicialização de
variáveis, mas não tem o suporte a namespaces.

Este é apenas mais um exemplo de como Python é uma linguagem "simples e
correta", como definiu meu amigo Geraldo Coen.
