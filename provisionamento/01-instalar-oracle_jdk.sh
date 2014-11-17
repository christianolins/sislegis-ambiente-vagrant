#!/bin/bash
# Author: Paulo Jeronimo (email: paulojeronimo@gmail.com, twitter: @paulojeronimo)
#
# Esse script deve ser executado pelo root!

echo "Instalando o Oracle JDK através do Fedy ..."
curl -sSL https://satya164.github.io/fedy/fedy-installer | bash
fedy -e oracle_jdk
