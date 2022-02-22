#!/bin/sh

echo "Iniciando a instalação do docker community edition..."
echo "Removendo todas as instâncias antigas do docker e instalando dependências"
apt remove -y docker docker-engine docker.io containerd runc
apt update
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "Baixando o docker mais recente e adicionando a chave GPG oficial"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

echo "Puxando o repositório mais recente"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update

echo "Instalando a edição da comunidade docker"
apt install -y docker-ce docker-ce-cli containerd.io

echo "Instalação do Docker concluída, instalando o docker-compose..."

echo "Baixando o docker-compose 2.2.3 - certifique-se de atualizar para o mais recente estável"
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

echo "Definindo permissões binárias"
chmod +x ~/.docker/cli-plugins/docker-compose

echo “Instalação do Docker e do docker-compose concluída”

# Execute o docker como usuário não root no Ubuntu
sudo usermod -aG docker $USER
