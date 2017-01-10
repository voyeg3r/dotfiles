### Introdução

### mostrar o nome entre aspas

 use a opção -Q

  quoted :)

### listar arquivos em full path

ls | sed s,^,$(pwd)/,

### listar em lista

ls -1

### Listar ocultos menos . e ..

 ls -A

### Listar arquivos de hoje

ls -al | grep -v '^d' | grep `date +%Y-%m-%d`

### Listar arquivos e seu tamanho

ls -Ssh1

# exibe arquivos maiores que 50M com seu respectivo tamanho e localização
find -size +50M -print0 | xargs -0 ls -Ssh1


### Listar arquivos por data 'time'

  ls -t

### Listar arquivo mais antigo

  ls -t | tail -1

  # pega somente arquivos
  ls -lt | grep '^-' | awk '{print $8}' | tail -1

### listar arquivo recem modificado

ls -Alt|head -2
ls -Alt | head -2 | awk 'END {print $8}'

### Listar arquivos ocultos

 ls -a

### Listar permissões de arquivo

 ls -l


### Encontrar o diretório mais recentemente modificado


ls -d --sort=time */ | head -n 1

 ls -lrt | awk '/^d/ { f=$NF }; END{ print f }'

