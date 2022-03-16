# LXC + DOCKER INSTRUCTIONS
- lxd init
- lxc launch ubuntu:20.04 docker -c security.nesting=true
- lxc exec docker -- apt-get remove docker docker-engine docker.io containerd runc -y
- lxc exec docker -- apt-get update
- lxc exec docker -- apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
- lxc exec docker -- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
- lxc exec docker -- add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
- lxc exec docker -- apt-key fingerprint 0EBFCD88
## Posterior a esto se configura de forma básica un contenedor usando docker
Una vez terminada la configuración, se puede realizar una redirección de puertos entre el contenedor de LXC y el contenedor docker. Adicionalmente, se puede implementar la redirección de puertos entre la máquina virtual y el contenedor LXC.
