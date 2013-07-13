#!/bin/bash
# este script instala ferramentas para
# administrar bancos de dados


apt-get install subversion build-essential checkinstall dpkg-dev pkg-config libx11-dev libglib2.0-dev libgtk2.0-dev libglade2-dev liblua50-dev liblualib50-dev libsigc++-2.0-dev libglibmm-2.4-dev libgtkmm-2.4-dev libpcre3-dev libxml2-dev libxml-parser-perl libgtkhtml2-dev libgnomeprint2.2-dev libexpat1-dev libglu1-mesa-dev uuid-dev python2.4 sun-java6-jdk autoconf automake libtool libmysqlclient15-dev

cd /usr/local/src/

svn co  mysql-gui-common

cd mysql-gui-common

chmod +x autogen.sh

./autogen.sh --enable-grt --enable-canvas --enable-java-modules --with-java-ldflags="-L/usr/lib/jvm/java-6-sun/jre/lib/i386/server/" --with-java-includes="/usr/lib/jvm/java-6-sun/include/" --enable-python-modules

make

checkinstall
