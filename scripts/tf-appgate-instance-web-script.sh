#!/bin/sh
#instalamos docker 
yum install -y yum-utils device-mapper-persistent-data lvm2 curl
yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
#habilitamos e iniciamos docker
systemctl enable docker
systemctl start docker
#instalamos docker compose
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#arrancamos el contenedor
docker-compose -f /tmp/docker-compose.yml up -d
