=Introdução= 
copia arquivos e/ou diretórios

 cp -r /pasta /destino/

A opção -u faz update

 cp -uvfa origem destino

Update, verbose, force, a=dpR
==copiando estrutura de pastas (somente a extrutura)== 

(cd /home/user/source/; find -type d -print0) | xargs -0 mkdir -p

==copiando e entrando na pasta== 

cp file ~/tmp
cd Alt .

==Opções interessantes== 

 cp -a /origem /destino

no caso acima a opção '-a' equivale a '-dpR'
sempre recomendada para fazer backups, para mais detalhes
leia o manual do cp

man cp

==Criando backup de arquivos de configuração== 

 cp /etc/resolv.conf{,.bak}

==varias copias== 

for i in {1..5}; do cp test{,$i};done

==conbinando com o find== 
Use -t when using find and cp
-t, --target-directory=DIRECTORY (copy all SOURCE arguments into DIRECTORY).

find . -name "*.pdf" -print0 | xargs -0 cp -t downloads/

Caso não usassemos a opção -t (que indica destino) o comando seria algo assim:

find /originalPath/ -iname \*.mp3 -print0 | xargs -0 -i cp ./{} /destinationPath/

=combinando com o ls= 

  ls *.jpg | xargs -n1 -i cp {} /external-hard-drive/directory
