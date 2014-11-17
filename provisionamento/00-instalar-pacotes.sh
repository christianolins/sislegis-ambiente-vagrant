#!/bin/bash
# Author: Paulo Jeronimo (email: paulojeronimo@gmail.com, twitter: @paulojeronimo)
#
# Esse script deve ser executado pelo root!

echo "Atualizando pacotes instalados ..."
yum -y update

echo "Instalando pacotes ..."
yum -y install \
vim \
rsync \
tar \
unzip \
wget \
git \
tree
