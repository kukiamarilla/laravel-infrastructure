# Automatización para despliegue de infraestructura y configuración de proyectos laravel

## Sobre el proyecto

Este es un template para automatizar el despliegue de infrestructura y para configurar proyectos laravel de manera automatizada utilizando `Terraform` y `Ansible`, la intención de este proyecto es poder desplegar un proyecto laravel desde cero ejecutando un solo comando, de modo a minimizar el error y el tiempo de despliegue.

Esta plantilla debe ser personalizada para cada proyecto según las necesidades de infraestructura y configuración

### Componentes configurables predefinidos

En esta plantilla se asumieron algunas herramientas que deben ser personalizadas para cada proyecto:
- Digital Ocean Droplet
- Digital Ocean Managed DB
- Servidor Nginx
- Certbot
- PHP 8.2

## Requerimientos

Para ejecutar el script se deben tener los siguiente paquetes instalados:
- Terraform
- Ansible

Además se deben crear y configurar el archivo `.env` con las variables de entorno necesarias.

También se debe crear un directorio llamado `ssh` en la base del proyecto y dentro de el mismo, un par de claves `id_rsa` e `id_rsa.pub`. La clave pública se utilizará para la autenticación en el servidor Git, por lo que hay que configurarla. Para generar las claves se puede utilizar el comando `ssh-keygen`.

Por otro lado, para poder desplegar infraestructura en digital ocean es necesario:
- Tener una cuenta de Digital Ocean con el suficiente crédito para crear la infraestructura
- Generar una API KEY de Digital Ocean y configurarlo en `.env` como valor de la variable `TF_VAR_DIGITAL_OCEAN_API_KEY`
- Configurar la clave pública del distpositivo que va a ejecutar el script en Digital Ocean, esto ayudará a que se pueda acceder desde este dispositivo al Droplet por SSH, sin configurar ninguna contraseña. Para esto se puede ejecutar el comando `cat ~/.ssh/id_rsa.pub`, y agregar esta clave a Digital Ocean ingresando desde el Dasboard a `Settings > Security > Add SSH Key`.
- Tener un dominio apuntando a las DNS de Digital Ocean `ns1.digitalocean.com`, `ns2.digitalocean.com` y `ns3.digitalocean.com`

# Uso

Una vez cumplidos todos los requerimientos, simplemente ejecute `sh run_deployment.sh` y espera a que termine de ejecutar.

Para destruir la infraestructura puede ejecutar `sh destroy.sh`.
