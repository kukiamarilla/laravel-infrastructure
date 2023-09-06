#!/bin/bash

# Cargamos las variables de entorno desde el archivo .env
export $(grep -v '^#' .env | xargs)

# Navegamos al directorio de Terraform
cd ./terraform

# Inicializamos y aplicamos las configuraciones de Terraform
terraform init
terraform apply -auto-approve

# Extraer IP del droplet provisionado por Terraform
export SERVER_IP=$(terraform output --raw ipv4_address)

export DB_HOST=$(terraform output --raw db_host)
export DB_PASSWORD=$(terraform output --raw db_password)
export DB_PORT=$(terraform output --raw db_port)

cd ..

touch ./ansible/hosts.ini
echo "[laravel_server]" > ./ansible/hosts.ini
echo "$SERVER_IP ansible_ssh_user=root" >> ./ansible/hosts.ini
ssh-keyscan $SERVER_IP >> ~/.ssh/known_hosts

cd ./ansible


ansible-playbook configure_server.yml -i hosts.ini
