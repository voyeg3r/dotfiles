source: http://goo.gl/olnBs

----------------------------------
MASSIVE-SCALE ONLINE COLLABORATION
----------------------------------

Por Luis van Ahn

Quantos de vocês já preencheu algum tipo de formulário da web em que tiveram
que ler uma distorcida sequência de caracteres como esta? Quantos de vocês
achou isso realmente chato? Ok, excelente. Então, eu inventei isso. (Risadas)
Ou fui uma das pessoas que inventou.

Aquela coisa é chamada CAPTCHA. E a razão pela qual isso existe é para garantir
que você, a entidade que preenche o formulário, é realmente um humano e não
apenas um programa de computador que foi criado para preencher formulários
milhões e milhões de vezes. A razão pela qual funciona é porque humanos, pelo
menos os que não possuem deficiências visuais, não possuem problema lendo esses
caracteres distorcidos, enquanto programas de computadores simplesmente não
fazem isso ainda. Por exemplo, no caso do Ticketmaster, a razão pelo qual você
tem que digitar esses caracteres distorcidos é para prevenir cambistas de
escreverem um programa que pode comprar milhões de ingressos, 2 por vez.

CAPTCHAs são usados por toda internet. E como são usados tão frequentemente,
muitas vezes a sequência aleatória de caracteres que é mostrada ao usuário não
é muito favorável. Assim este exemplo é da página de registro do Yahoo. Os
caracteres aleatórios que acabaram sendo exibidos ao usuário foram W, A, I, T,
que, em inglês, forma a palavra "espere". Mas a melhor parte desta mensagem foi
a que o setor de ajuda do Yahoo recebeu 20 minutos depois. Texto: "Ajuda! Estou
esperando a mais de 20 minutos, e nada acontece." (Risadas) Esta pessoa pensou
que precisava esperar. Isto é claro, não é tão ruim como esta pobre pessoa.

(Risadas)

O Projeto CAPTCHA é algo que fizemos aqui na Carnegie Melllon mais de 10 anos
atrás, e tem sido usado em toda parte. Deixe-me agora contar-lhes sobre um
projeto que fizemos alguns anos atrás, que é como uma evolução do CAPTCHA. Este
é um projeto que chamamos reCAPTCHA, que é algo que começamos na Carnegie
Mellon, então nós o transformamos em uma empresa voltada a alta tecnologia.
E cerca de um ano e meio atrás, Google adquiriu esta companhia.

Assim deixe-me contar-lhes o que este projeto iniciou. Então este projeto
começou a partir da seguinte percepção: Acontece que aproximadamente 200
milhões de CAPTCHAs são digitadas todos os dias por pessoas em todo mundo.
Quando ouvi isso a primeira vez, fiquei muito orgulhoso. Pensei, veja o impacto
que a minha pesquisa teve. Mas aí eu comecei a me sentir mal. Veja aqui esta
a coisa, toda vez que você digita um CAPTCHA, essencialmente você perde 10
segundos do seu tempo. E se você multiplicar isso por 200 milhões, você percebe
que a humanidade como um todo está gastando 500.000 horas todo dia digitando
esses chatos CAPTCHAs. Então comecei a me sentir mal.

(Risadas)

E então comecei a pensar, bem, é claro, não podemos nos livrar dos CAPTCHAs,
porque de certa forma a segurança na Web depende disso. Mas então eu comecei
a pensar, existe alguma forma de usarmos esse empenho para algo que seja bom
para a humanidade? Então veja, aqui está. Enquanto você está digitando um
CAPTCHA, durante estes 10 segundos, seu cérebro está fazendo algo
extraordinário. Seu cérebro está fazendo algo que computadores não podem fazer.
Assim será que conseguimos fazer você produzir algo útil nesses 10 segundos?
Outra forma de explicar isso é, existem alguns problemas enormes que
computadores não conseguem resolver, mas que conseguimos dividir em pedaços de
10 segundos para que toda vez que alguém solucione um CAPTCHA ele resolva uma
pequena parte deste problema? E a resposta é "sim", e isto é o que estamos
fazendo agora.

Assim o que talvez você não saiba é que hoje em dia enquanto você digita um
CAPTCHA, não apenas você está se autenticando como humano, mas em adição você
está realmente nos ajudando a digitalizar livros. Então deixem-me explicar como
isso funciona. Existem muitos projetos por aí tentando digitalizar livros.
Google tem um. O Internet Archive tem um. Amazon, agora com o Kindle, está
tentando digitalizar livros. Basicamente a forma como isso funciona é você
começa com um livro antigo. Já viram essas coisas, certo? Tipo um livro?
(Risadas) Então você começa com um livro, e aí você o scanneia.

Agora scannear um livro é como tirar uma fotografia de cada página do livro.
Ele te dá uma imagem para cada página do livro. Esta é uma imagem com texto de
cada página do livro. O próximo passo no processo é que o computador precisa
ser capaz de decifrar todas as palavras nesta imagem. Isto usando uma
tecnologia chamada OCR, que significa reconhecimento ótico de caractere, que
tira uma foto do texto e tenta descobrir que texto está ali. O problema é que
OCR não é perfeito. Especialmente em livros antigos em que a tinta desbotou
e as páginas ficaram amarelas, OCR não consegue reconhecer muitas das palavras.
Por exemplo, para coisas que foram escritas a mais de 50 anos atrás,
o computador não consegue reconhecer 30% das palavras. Assim o que estamos
fazendo agora é pegar todas as palavras que o computador não reconhece
e estamos fazendo com que pessoas as leiam para nós enquanto elas digitam um
CAPTCHA na internet.

Assim, na próxima vez que você digitar um CAPTCHA , as palavras que você está
digitando são na verdade palavras vindas de livros que estão sendo
digitalizados que o computador não reconheceu. E agora o motivo pelo qual temos
2 palavras atualmente ao invés de uma é porque, veja você, uma das palavras
é uma palavra que o sistema acabou de tirar de um livro, ele não sabe o que é,
e ele irá apresentá-la a você. Mas como ele não sabe a resposta para ela, ele
não pode te avaliar. Assim o que fazemos é dar a você outra palavra, uma que
o sistema conheça a resposta. Nós não te contamos qual é qual, e dizemos, favor
digitar as duas. E se você digitar a palavra certa para uma das palavras que
o sistema já conhece a resposta, ele assume que você é humano, e ele também
confia que você digitou a outra palavra corretamente. E se repetirmos esse
processo para 10 diferentes pessoas e todas elas concordem qual é a palavra
nova, assim conseguimos mais uma palavra precisamente digitalizada.

Então é assim que o sistema funciona. E basicamente, já que lançamos isto cerca
de 3 ou 4 anos atrás, muitos websites começaram a trocar o antigo CAPTCHA em
que as pessoas perdiam seu tempo para o novo CAPTCHA em que as pessoas ajudam
a digitalizar livros. Assim por exemplo, Ticketmaster. Toda vez que você
comprar ingressos pelo Ticketmaster, você está ajudando a digitalizar um livro.
Facebook: Toda vez que você adiciona um amigo ou cutuca alguém, você está
ajudando a digitalizar um livro. Twitter e cerca de 350.000 outros sites todos
usam reCAPTCHA. E na verdade, o número de sites usando reCAPTCHA é tão alto que
o número de palavras que são digitalizadas por dia é realmente, relamente
grande. É cerca de 100 milhões por dia, o que é o equivalente a 2,5 milhões de
livros por ano. E tudo isto tem sido feito uma palavra por vez somente por
pessoas digitando CAPTCHAs na internet.

(Aplausos)

Agora é claro, já que estamos fazendo tantas palavras por dia, coisas
engraçadas podem acontecer. E isto é especialmente verdadeiro porque agora
estamos dando às pessoas 2 palavras aleatórias em inglês próximas uma da outra.
Assim coisas engraçadas podem acontecer. Por exemplo, apresentamos esta
palavra. É a palavra "Cristãos"; não há nada de errado com ela. Mas se
apresentarmos junto com outra palavra escolhida aleatoriamente, coisas ruins
podem acontecer. Assim chegamos nisso. (Texto: maus cristãos) Mas é ainda pior,
porque o site em particular em que isso apareceu é de fato chamado A Embaixada
do Reino de Deus. (Risadas) Oops. (Risadas) Aqui está outra realmente ruim.
	JohnEdwards.com (Texto: Maldito liberal) (Risadas) Assim continuamos
	a insultar pessoas aqui e ali todo dia.

Agora, é claro, não estamos insultando pessoas. Veja aqui está a coisa, desde
que apresentamos 2 palavras escolhidas aleatoriamente, coisas interessantes
acontecem. Assim isso realmente tem dado origem a uma enorme transmissão
cultural via internet que dezenas de milhares de pessoas têm participado, que
é chamado arte CAPTCHA. Tenho certeza que alguns de vocês já ouviram falar
disso. Isto funciona assim. Imagine que voê está usando a internet e você vê um
CAPTCHA que você acredita ser de alguma forma peculiar, como este CAPTCHA.
(Texto: torradeira invisível) Assim o que você deve fazer é tirar uma foto da
tela. Então é claro, você preenche seu CAPTCHA porque você está nos ajudando
a digitalizar um livro. Mas então, primeiro você tira uma foto da tela, e então
você desenha algo relacionado com ela. (Risadas) É assim que funciona. Existem
dezenas de milhares destes. Alguns são muito fofos. (Texto: Aperte isso)
(Risadas) Alguns são mais engraçados. (Texto: fundadores chapados) (Risadas)
E alguns deles, como uma sequência paleontológica de letras, contém Snoop Dogg.

(Risadas)

Ok, então este é o meu número favorito de reCAPTCHA. Então isto é minha coisa
favorita de todo este projeto. Este é o número de pessoas distintas que nos
ajudaram a digitalizar pelo menos uma palavra de um livro através do reCAPTCHA
750 milhões, que é um pouco mais de 10% da população mundial, nos ajudou
a digitalizar o conhecimento humano. E são números como este que motivam minha
agenda de pesquisa. Assim a questão que motiva minha pesquisa é a seguinte: Se
você olhar para as conquitas humanas em larga escala, essas coisas realmente
enormes que a humanidade se juntou e realizou historicamente -- como por
exemplo, construir as pirâmides do Egito ou o Canal do Panamá ou colocar
o homem na Lua -- existem fatos curiosos sobre isso, e é que todos elas foram
feitas quase com o mesmo número de pessoas. É estranho; todas elas foram feitas
com cerca de 100.000 pessoas. E a razão para isso é porque, antes da internet,
coordenar mais de 100.000 pessoas, muito menos pagá-las, era essencialmente
impossível. Mas agora com a internet, acabo de mostrar-lhes um projeto em que
tivemos 750 milhões de pessoas nos ajudando a digitalizar o conhecimento
humano. Assim a pergunta que motiva minha pesquisa é, se conseguimos colocar
o homem na Lua com 100.000 o que podemos fazer com 100 milhões?

Assim baseado nesta questão, temos diferentes projetos em que estamos
trabalhando. Deixem-me ocntar-lhe sobre um que estou mais empolgado. Isto
é algo que estamos trabalhando semi-quietos mais ou menos no último ano e meio.
Anda não foi lançado. É chamdo Duolingo. Já que não foi lançado, shhhhhhh!
(Risadas) Sim, posso confiar que farão isso. Então este é o projeto. Aqui
é como começou. Começou comigo perguntando a meu aluno de graduação, Severin
Hacker. Ok, este é Severin Hacker. Então fiz a pergunta a meu aluno de
graduação. E sim, você me ouviram corretamente; o sobrenome dele é Hacker.
Então fiz esta pergunta a ele: Como podemos conseguir 100 milhões de pessoas
traduzindo a Web nas principais línguas gratuitamente?

Ok, tem muitas coisas a serem ditas sobre esta pergunta. Primeiro, traduzir
a Web. Atualmente a Web é dividida em diversas línguas. Uma grande fração dela
é em Inglês. Se você não conhece inglês, você não tem acesso a ela. Mas existem
grandes frações em outras línguas diferentes, e se você não conhece essas
línguas, você não tem acesso a ela. Assim eu gostaria de traduzir toda a Web,
ou pelo menos a maiorira da Web, em cada língua principal. Então é isso que
gostaria de fazer.

Agora alguns de vocês podem dizer, porque não usamos computadores para
traduzir? Porque não usamos uma máquina de tradução? Máquinas de tradução hoje
em dia estão começando a traduzir algumas frases aqui e ali. Porque não
a usamos para traduzir toda a Web? Bem o problema com isso é que ainda não
é bom o suficiente e provavelmente não o será nos próximos 15 a 20 anos. Ela
erra muito. Mesmo quando não erra, como faz muitos erros, você não sabe se deve
confiar ou não.

Então deixe-me lhes mostrar um exemplo de algo que foi traduzido com uma
máquina. Na verdade eram posts de forum. Era alguém que estava tentando
perguntar algo sobre JavaScript. Foi traduzido do japonês para o inglês. Vou
apenas deixá-los ler. Esta pessoa começa se desculpando pelo fato do texto ser
traduzido por um computador. Então a próxima frase será a introdução da
questão. Então ele está explicando algo. Lembrem-se é uma questão sobre
JavaScript. (Texto: Em frequentemente, o tempo cabra instala um erro é vômito.)
(Risadas) Então vem a primeira parte da questão. (Texto: Quantas vezes como
o vento, um poste e um dragão?) (Risadas) Aí vem minha parte favorita da
questão. (Texto: Isto insulta o pai das pedras?) (Risadas) E aí vem o final,
que é minha parte favorita de tudo isso. (Texto: Por favor desculpe-se por sua
estupidez. Existem muitos obrigados.) (Risadas) Ok, então a tradução por
computador, ainda não é boa o suficiente. Assim de volta a questão.

Então precisamos de pessoas para traduzir toda a Web. Agora a próxima pergunta
que vocês devem ter é, então porque nós simplesmente não pagamos pessoas para
fazer isso? Poderíamos pagar tradutores profissionais para traduzir toda a Web.
Podemos fazer isso. Infelizmente, seria extremamente caro. Por exemplo,
traduzindo uma pequenina fração de toda a Web, Wikipedia, em outra língua,
Espanhol. Wikipedia existe em espanhol, mas é muito pequena se comparada com
a versão em inglês. É cerca de 20% do tamanho da em inglês. Se quisermos
traduzir os outros 80% em espanhol, custaria pelo menos 50 milhões de dólares
-- e isto no mais explorado, país terceirizado por aí. Assim seria muito caro.
Então o que queremos fazer é pegar 100 milhões de pessoas traduzindo a Web em
cada língua principal de graça.

Agora se é isto que você quer fazer, você provavelmente encontrará duas grandes
barreiras, dois grandes obstáculos. O primeiro é a falta de pessoas bilíngues.
Assim eu nem sei se existe por aí 100 milhões de pessoas usando a Web que são
bilíngues o suficiente para nos ajudar a traduzir. Isto é um grande problema.
O outro problema que você encontrará é a falta de motivação. Como iremos
motivar as pessoas para realmente traduzirem a Web de graça? Normalmente, você
deve pagar a pessoa para fazer isso. Então como iremos motivá-las para fazer
isto de graça? Agora quando começamos a pensar nisso, fomos bloqueados por
essas duas coisas. Mas aí percebemos, que existe sim uma forma de resolver
esses dois problemas com a mesma solução. Uma forma de matar dois pássaros com
uma só pedra. E istó é transformar a tradução de línguas em algo que milhões de
pessoas querem fazer, e isto também ajuda com o problema da falta de bilíngues,
e isto é educação de línguas.

Assim acontece que hoje em dia, existem mais de 1.2 milhões de pessoas
aprendendo uma língua estrangeira. Pessoas que realmente querem aprender uma
língua estrangeira. E não é apenas porque elas estão sendo forçadas a isso na
escola. Por exemplo, apenas nos Estados Unidos, existem mais de 5 milhões de
pessoas que pagaram mais de 500 dólares em softwares para aprender uma nova
língua. Assim as pessoas realmente querem aprender uma nova língua. Então o que
estamos trabalhando no último ano e meio é um novo site -- chamdo Duolingo --
em que a ideia básica é que as pessoas aprendem uma nova língua de graça
enquanto simultaneamente traduzem a Web. E então basicamente elas estão
aprendendo fazendo.

Assim a forma como isso funciona é que desde quando você é um iniciante, lhes
damos frases muito simples. Existem, é claro, muitas frases simples na Web.
Lhes damos frases muito, muito simples junto com o significado de cada palavra.
E quando você as traduz, e ao ver como outras pessoas as traduzem, você começa
a aprender a língua. E ao se tornar mais e mais avançado, lhes damos frases
mais e mais complexas para traduzir. Mas todas as vezes, você aprende fazendo.

Agora a coisa mais doida sobre este método é que realmente funciona. Primeiro,
as pessoas realmente estao aprendendo uma língua. Nós praticamente acabamos de
construir, e agora estamos testando. Pessoas realmente podem aprender uma
língua com isto. E eles aprendem tão bem quanto com os softwares de ensino de
línguas. Assim as pessoas realmente aprendem uma língua. E não apenas
a aprendem bem, mas de uma forma mais interessante. Porque com Duolingo, as
pessoas aprendem realmente com um conteúdo real. Ao contrário de aprenderem com
frases inventadas, as pessoas estão aprendendo com conteúdo real o que
é inerentemente interessante. Assim as pessoas realmente aprendem uma língua.

Mas talvez o mais surpreendente, as traduções que obtemos das pessoas que usam
o site, ainda que sejam inciantes, as traduções que obtemos são tão precisas
quanto as de um tradutor profissional, o que é muito surpreendente. Assim
deixem-me mostrar-lhes um exemplo. Esta é uma frase que foi traduzida do alemão
para o inglês. No alto está o alemão. No meio está a tradução em inglês ela foi
feita por alguém que é um tradutor profissional que pagamos 20 centavos
a palavra por esta tradução. E embaixo está a tradução de usuários do Duolingo,
nenhum deles conhecia nada de alemão antes de começarem a usar este site. Como
podem ver, está praticamente perfeita. Agora, é claro, fizemos um truque aqui
para tornar as traduções tão boas quanto as de tradutores profissionais.
Combinamos as traduções de diversos iniciantes para chegar a qualidade de um
tradutor profissional.

Agora mesmo que estejamos combinando traduções, o site realmente pode traduzir
rapidamente. Então deixem-me mostrar-lhes, esta é nossa estimativa de quão
rápido podemos traduzir a Wikipedia de inglês para espanhol. Lembre-se, isto
vale 50 milhões dólares. Então se queremos traduzir a Wikipedia em espanhol,
podemos fazer isto em 5 semanas com 100 mil usuários ativos. E poderíamos fazer
isto em cerca de 80 horas com um milhão de usuários ativos. Partindo do
princípio que todos os projetos que meu grupo trabalhou até então tiveram
milhões de usuários, estamos esperançosos em podermos traduzir extremamente
rápido com este projeto.

Agora a coisa que estou mais animado com o Duolingo é que acredito que ele
disponibiliza um modelo de negócio para o ensino de línguas. Então aqui está:
O modelo atual de negócio para ensino de línguas é aquele em que o estudante
paga, e particularmente, o estudante paga ao software Rosetta Stone 500
dólares. (Risadas) Este é o modelo de negócios atual. O problema com este
modelo de negócio é que 95% da população mundial não possui 500 dólares. Então
é extremamente injusto com os pobres. Isto é totalmente direcionado aos ricos.
Agora vejam, com Duolingo, porque enquanto você aprende você realmente cria
valor, você está traduzindo coisas -- o que por exemplo, nós poderíamos cobrar
de alguém pela traduções. Então é assim que podemos rentabilizar isto. Já que
as pessoas estão criando valor enquanto aprendem, elas não precisam pagar com
seu dinheiro, elas pagam com seu tempo. Mas a mágica aqui é que elas estão
pagando com seu tempo, mas este é um tempo que estaria sendo gasto de qualquer
forma no aprendizando de uma língua. O bom do Duolingo é que acredito que ele
disponibiliza um modelo de negócios justo -- um que não discrimina as pessoas
pobres.

Então aqui está o site. Obrigado. (Aplausos) Então aqui está o site. Ainda não
lançamos, mas se você acessá-lo, poderá se registrar para fazer parte da versão
beta privada, que provavelmente começará em 3 ou 4 semanas. Ainda não lançamos
este Duolingo.

Por sinal, sou eu quem está falando aqui, mas na verdade Duolingo é o trabalho
de uma equipe fantástica e certos membros estão aqui. Então, obrigado.

(Aplausos)
