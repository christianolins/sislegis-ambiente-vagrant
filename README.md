# sislegis-ambiente-vagrant

Scripts para montagem do ambiente de desenvolvimento do SISLEGIS numa `box` [Vagrant] executando o [Fedora] 20.

*Objetivo principal*: montar, rapidamente, um ambiente para a construção e execução do [sislegis-app] que possa ser executável em qualquer sistema operacional Windows, Linux ou OS X.

## Fork de projetos

Faça o fork dos seguintes projetos para a tua conta no GitHub:
* [sislegis-dotfiles]
* [sislegis-ambiente]
* [sislegis-app]

## Pré-instalação

### No Windows
#### Instale o [Cygwin]
Pacotes que você deve instalar (necessários): git, ssh.

Pacotes opcionais (sugerimos sua instalação): tmux, tree, unzip, vim.

Coloque os binários do Cygwin no PATH do sistema! Isso será necessário para a execução do Vagrant nesse ambiente.

### No OS X
TODO

### No Linux
TODO

## Instalação

### Instale o [VirtualBox]
### Instale o [Vagrant]

## Passo a passo (em qualquer ambiente)

Abra um shell (no caso do Windows, inicie o Cygwin).

Clone este projeto e mude para seu diretório:
```bash
git clone https://github.com/pensandoodireito/sislegis-ambiente-vagrant
cd sislegis-ambiente-vagrant
```

Crie e edite o arquivo config para informar os teus dados:
```bash
cp config.exemplo config
vim config
```

Inicie o vagrant conforme o comando a seguir. O provisionamento da máquina ocorrerá automaticamente. Aguarde! (aproveite para [estudar Vagrant](http://paulojeronimo.github.io/tutorial-vagrant) ou tomar um café enquanto isso ocorre! ;)

```bash
vagrant up
```

Quando o processo de provisionamento terminar, você poderá acessar a URL da aplicação sislegis em http://localhost:8080/sislegis.

## Detalhes operacionais

Após a `box` ter sido provisionada e você ter acessado a URL da sislegis-app, você deverá notar que:

1. O diretório `projetos` estará acessível tanto no HOST quanto na `box`. Ele contém outros projetos do SISLEGIS, como o sislegis-app (app) e o [sislegis-site] (site).
2. Os seguintes diretórios também existirão no HOST e estarão montados na `box`:
    1. `.m2` -> repositório local do maven;
    2. `instaladores/fedy_dl` -> pacotes instalados pelo Fedy (ex.: Oracle JDK);
    3. `instaladores/sislegis-ambiente` -> instaladores do Maven, Forge, WildFly, etc, baixados durante a montagem do ambiente pelo projeto [sislegis-ambiente].

Para encerrar a execução da box, execute:

```bash
vagrant halt
```

Para efetuar o deploy do sislegis-app dentro da `box` (sem parar o jboss):
```bash
vagrant ssh
app_clean_package
app_deploy
```

Estando na `box`, para operar a execução do WildFly os comandos para parar, verificar o status e reiniciar são:
```
jboss_stop
jboss_status
jboss_start
```

Note que o WildFly está configurado para ser iniciado automaticamente no boot da `box`.

[VirtualBox]:http://virtualbox.org
[Vagrant]:https://www.vagrantup.com/
[sislegis-ambiente]:http://github.com/pensandoodireito/sislegis-ambiente
[sislegis-dotfiles]:http://github.com/pensandoodireito/sislegis-dotfiles
[sislegis-site]:http://github.com/pensandoodireito/sislegis-site
[Fedora]:http://fedoraproject.org
[sislegis-app]:http://github.com/pensandoodireito/sislegis-app
[Cygwin]:http://www.cygwin.com
