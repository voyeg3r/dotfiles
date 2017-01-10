### Introdução
Imprime mensagens na tela


 echo "Alô mundo"

Algo mais elaborado

echo 172.30.40.{1,255} | tr " " "\n"

o código acima imprime todos os ips da faixa 172.30.40
de 1 a 255, um por linha.
### notificador de mensagens

echo notify-send test | at now+1minute

### enviando mensagem para uma maquina windows

echo "message" | smbclient -M NAME_OF_THE_COMPUTER


### Gerando todas as combinações possiveis de dois conjuntos


echo {1..z}:{1,2,3}
a:1 a:2 a:3 b:1 b:2 b:3 c:1 c:2 c:3 d:1 d:2 d:3 e:1 e:2
e:3 f:1 f:2 f:3 g:1 g:2 g:3 h:1 h:2 h:3 i:1 i:2 i:3 j:1 j:2 j:3 k:1 k:2 k:3 l:1
l:2 l:3 m:1 m:2 m:3 n:1 n:2 n:3 o:1 o:2 o:3 p:1 p:2 p:3 q:1 q:2 q:3 r:1 r:2 r:3 s:1
s:2 s:3 t:1 t:2 t:3 u:1 u:2 u:3 v:1 v:2 v:3 w:1 w:2 w:3 x:1 x:2 x:3 y:1 y:2 y:3
z:1 z:2 z:3


### gerar números randômicos

echo $RANDOM

# numeros randomicos entre 1 e x
echo $((RANDOM%X))

### mostrar o path 1 por linha

echo -e "${PATH//:/\n}"

A opção -e habilita a interpretação de escapes "\"
### Para emitir um beep

echo -e \\a

### Criando uma função beep no bashrc

beep () {
echo -e -n \\a
}

### Para parar o beep no terminal acrescente
no arquivo /etc/rc.local antes de "exit 0":

rmmod pcspkr

### usando o echo para testar uma saida antes de executar outro comando
Eu queria fazer uma remoação e resolvi testar antes

echo conf-sys.[2-3]*

depois fiz apenas a substituição do echo pelo "rm -f"

^echo^rm -f

### trocando quebras de linha por espaço

echo "aa\nbb\ncc\ndd\n123" | xargs echo

### Generate padded numbers 001 002 ... 100
fonte: http://www.commandlinefu.com/commands/view/2127/generate-padded-numbers-001-002-...-100

echo {001..100}

Mas tudo o que foi digitado acima pode ser feito assim:

seq -w 100

### criar um script com o último comando

echo "!!" > foo.sh
