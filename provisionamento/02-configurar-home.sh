#!/bin/bash
# Author: Paulo Jeronimo (email: paulojeronimo@gmail.com, twitter: @paulojeronimo)
#
# Esse script deve ser executado pelo usuário vagrant!
set -e

echo "Copiando e carregando as configurações ..."
cp /vagrant/config ~/.github
source ~/.github

echo "Instalando sislegis-dotfiles ..."
git clone $GITHUB_SISLEGIS_DOTFILES
${GITHUB_SISLEGIS_DOTFILES##*/}/install

echo "Instalando sislegis-ambiente ..."
git clone $GITHUB_SISLEGIS_AMBIENTE
cat > ${GITHUB_SISLEGIS_AMBIENTE##*/}/ambiente.config <<EOF
export PROJETOS_DIR=~/projetos
EOF
${GITHUB_SISLEGIS_AMBIENTE##*/}/instalar

# vim: set ts=2 sw=2 expandtab:
