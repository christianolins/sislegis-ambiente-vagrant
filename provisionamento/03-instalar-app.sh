#!/bin/bash
# Author: Paulo Jeronimo (email: paulojeronimo@gmail.com, twitter: @paulojeronimo)

source ~/.`hostname -s`

salvar_instaladores
app_baixar
app_update_and_deploy
jboss_start

# vim: set ts=4 sw=4 expandtab:
