#!/bin/bash
# Criado em:Qui 05/Jan/2006 hs 13:13
# ultima modificação: Sex 03 Fev 2006 20:17:48 BRST
# Agenda telefônica
# Autor: Sérgio Luiz Araújo Silva
# script para criar uma instância do moinmoin
# instale o apache2 e o moinmoin


# Recolher alguns dados importantes
export PREFIX=/usr                # isto pode ser outra coisa
export SHARE=$PREFIX/share/moin   # isto deve estar correcto parra a maioria das pessoas
export WIKILOCATION=$SHARE        # isto é apenas um exemplo
export INSTANCE=seriv             # isto é apenas um exemplo

# Os administradores precisarão ainda de mais duas linhas:
export USER=www-data              # isto é apenas um exemplo
export GROUP=www-data             # isto é apenas um exemplo

# Copiar as pastas
cd $WIKILOCATION
mkdir $INSTANCE                   # cria uma directoria para esta instância
cp -R $SHARE/data $INSTANCE       # copia a directoria template data
cp -R $SHARE/underlay $INSTANCE   # copia a directoria underlay data
cp $SHARE/config/wikiconfig.py $INSTANCE   # copia o ficheiro exemplo de configuração do wiki

# Definir permissões
chown -R $USER.$GROUP $INSTANCE   # verifique se o USER e o GROUP estão correctos
chmod -R ug+rwX $INSTANCE         # USER.GROUP pode ler e editar
chmod -R o-rwx $INSTANCE          # todos os outros utilizadores serão rejeitados

# Criar uma instância do wiki implica copiar ficheiros e atribuir
# permissões apropriadas. Antes de continuar, é necessário saber qual
# o utilizador e grupo que o seu servidor Apache utiliza.
# A forma mais simples de o saber, é executar este comando:
#          egrep "^User|^Group" /etc/apache2/apache2.conf

# Instalar o moin.cgi
cd $WIKILOCATION/$INSTANCE
mkdir cgi-bin
cp $SHARE/server/moin.cgi cgi-bin
chown -R $USER.$GROUP cgi-bin
chmod -R ug+rx cgi-bin
chmod -R o-rwx cgi-bin

# Quando o moin.cgi é iniciado, importa um módulo do MoinMoin
# que por sua vez importa outros módulos e o ficheiro de configuração.
# Os módulos do MoinMoin devem encontrar-se num sistema devidamente configurado
# (como descrito na ../InstalaçãoBásica), mas é provável que o ficheiro de
# configuração não seja encontrado. Edite o script do moin.cgi para
# corrigir esta situação. Adicione estas linhas junto ao topo do ficheiro:

# import sys
# sys.path.insert(0, '..')

# Configurar o Apache
echo "" >>/etc/apache2/apache2.conf
echo "Alias /moin_static160/ \"$SHARE/htdocs/\"" >>/etc/apache2/httpd.conf
echo "ScriptAlias /mywiki \"$WIKILOCATION/$INSTANCE/cgi-bin/moin.cgi\"" >>/etc/apache2/httpd.conf

# Isto deve adicionar duas linhas, como as que apresentamos em baixo,
# a um ficheiro config (possivelmente deve utilizar um para cada servidor virtual):

# Alias /moin_static160/ /usr/local/share/htdocs/
# ScriptAlias /mywiki /usr/local/share/moin/mywiki/cgi-bin/moin.cgi

# Configurar o MoinMoin #####################
# Finalmente, cerifique que o ficheiro wikiconfig.py na directoria instance contém os caminhos correctos para:

#    *  url_prefix_static (coisas estáticas como css/img/js)
#    *  data_dir (a directoria data da instância) e
#    *  data_underlay_dir (a directoria underlay da instância).




