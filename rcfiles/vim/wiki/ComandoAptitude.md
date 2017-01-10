### Introdução

aptitude search pacote

A primeira coluna (p) indica o estado do pacote, que pode ser:

i: Instalado
v: pacote virtual (um pacote que como dependência possui outros pacotes)
p: pacote não instalado
c: Removido, mas os arquivos de configuração ainda estão presentes
u: Desempacotado
B: Quebrado
C: Meio-configurado
H: meio-instalado


  q  ............... sair do aptitude
  /  ............... fazer busca por pacote
  n  ............... próxima ocorrência de uma busca
  ^h ............... ajuda
  j  ............... desce na lista
  K  ............... sobe na lista
  g  ............... vai para a primeira linha de uma lista
  G  ............... vai para a última linha de uma lista

### Listar pacotes instalados

    aptitude search -F '%100p' '~i!~M'

### remover kernels não usados

aptitude purge linux-image | grep ^i | grep -v $(uname -r)

### Opções interessantes do aptitude
Se desejar que ele não faça perguntas após pressionar Enter
use a opção -y que faz com que o aptitude instale direto o pacote

aptitude -y install vim-gnome vim-doc

### Removendo um pacote e seus arquivos de configuração

sudo aptitude purge nome_do_pacote

### removendo kernels não usados

aptitude remove $(dpkg -l|egrep '^ii linux-(im|he)'|awk '{print $2}'|grep -v `uname -r`)

### Filtrando pacotes para instalação

aptitude install `aptitude search vim -F %p`
# A opção -F do aptitude suprime colunas de informação sobre
# os pacotes encontrados na busca do aptitude, a opção %p
# faz com que sejam exibidos somente os nomes

### Agendando uma instalação
No meu caso é muito útil pois às vezes quero instalar um pacote mas a rede
está muito lenta, agendando agente não corre o risco de esquecer

# For instance,
aptitude --schedule-only install evolution will

# schedule the evolution package for later installation.



### Controlando a instalação das recomendações


# instala pacote sem recomendações
aptitude -R install wesnoth

# instala pacote com recomendações
aptitude -r install wesnoth



### Referências
* http://wiki.forumdebian.com.br/index.php/Conhecendo_o_Aptitude
* http://blog.josemorelli.net/2006/05/07/gerenciando-pacotes-com-o-aptitude/
* http://infog.casoft.info/?tag=aptitude&paged=2
* http://www.debianadmin.com/list-your-installed-package-versions-with-apt-show-versions.html listar versões de pacotes
