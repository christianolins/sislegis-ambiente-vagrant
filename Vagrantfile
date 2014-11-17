# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Lista de providers fedora: https://vagrantcloud.com/search?utf8=✓&sort=&provider=&q=fedora

  config.vm.box = "paulojeronimo/fedora20"

  config.vm.host_name = "sislegis"

  # Exporta as portas utilizadas pelo WildFly
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 9990, host: 9990

  config.vm.provider "virtualbox" do |v|
    #v.gui = true
    v.name = "sislegis"
    v.memory = 1024
  end

  # Diretórios compartilhados
  config.vm.synced_folder "instaladores/fedy_dl", "/fedy_dl", 
    create: true, owner: "root", group: "root"
  config.vm.synced_folder "instaladores/sislegis-ambiente", 
    "/home/vagrant/sislegis-ambiente.instaladores", create: true
  config.vm.synced_folder "projetos", 
    "/home/vagrant/projetos", create: true
  config.vm.synced_folder ".m2", 
    "/home/vagrant/.m2", create: true

  # Provisionamento
  config.vm.provision :shell, :path => "provisionamento/00-instalar-pacotes.sh"
  config.vm.provision :shell, :path => "provisionamento/01-instalar-oracle_jdk.sh"
  config.vm.provision :shell, privileged: false, :path => "provisionamento/02-configurar-home.sh"
  config.vm.provision :shell, privileged: false, :path => "provisionamento/03-instalar-app.sh"

  # Sem essa configuração o script de provisionamento dá erro:
  config.ssh.pty = true
end
