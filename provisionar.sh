#!/bin/bash
# Author: Paulo Jeronimo (email: paulojeronimo@gmail.com, twitter: @paulojeronimo)

# Configure:
GITHUB_USER=paulojeronimo
GITHUB_NAME='Paulo Jerônimo'
GITHUB_EMAIL=paulojeronimo@gmail.com

#source config &> /dev/null || exit $?

# ----------------------------------------------------------
# A partir daqui, só altere se souber o que está fazendo! ;)
# ----------------------------------------------------------
GITHUB_SISLEGIS_DOTFILES=http://github.com/$GITHUB_USER/sislegis-dotfiles
GITHUB_SISLEGIS_AMBIENTE=http://github.com/$GITHUB_USER/sislegis-ambiente

# Diretório para a instalação dos projetos: deve ser relativo a $HOME
INSTALL_DIR=.

#sudo yum -y update -x 'kernel*'
#sudo yum -y install vim yum-utils
sudo yum -y install rsync tar unzip wget git tree

curl -sSL https://satya164.github.io/fedy/fedy-installer | sudo bash
sudo fedy -e oracle_jdk

cd && mkdir -p $INSTALL_DIR && cd $INSTALL_DIR
git clone $GITHUB_SISLEGIS_DOTFILES
${GITHUB_SISLEGIS_DOTFILES##*/}/install

cat > ~/.github <<EOF
GITHUB_USER=$GITHUB_USER
GITHUB_NAME='$GITHUB_NAME'
GITHUB_EMAIL=$GITHUB_EMAIL
EOF

git clone $GITHUB_SISLEGIS_AMBIENTE
${GITHUB_SISLEGIS_AMBIENTE##*/}/instalar

source ~/.`hostname -s`

app_baixar
app_remote_add_upstream
app_fetch_upstream
app_merge_upstream_master
mvn clean package -DskipTests
#jboss_start &
cp target/sislegis.war $JBOSS_HOME/standalone/deployments

# vim: set ts=4 sw=4 expandtab:
