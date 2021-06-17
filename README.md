# Appgate 

A continuación se describe el desarrollo realizado para Appgate

## Comenzando 🚀

_Estas instrucciones te permitirán obtener una copia del proyecto y teniendo las credeciales con permisos en aws, poder ejecutar el código de terraform._

### Pre-requisitos 📋

_Como requisitos es necesario tener instalado terraform en el equipo, clonar este repositorio y contar con:_

```
1. Una llave pem.
2. Un AWS access key
3. Un AWS secret key
```

### Instalación 🔧

_Para realizar la instalación, ejecución y teniendo los prerequisitos, se debe realizar:_

_Cambiar variables en archivo terraform.tfvars_

```
appgate_aws_pem_key = "archivo_pem.pem"
appgate_aws_key_name = "archivo_pem"
appgate_aws_access_key = "aws_access_key"
appgate_aws_secret_key = "aws_secret_key"
```

_luego de esto dar el comando de terraform para ejecución_

```
terraform apply
```

## Explicación punto por punto 🛠️

_A continuación se explica la ubicación del código por cada punto solicitado_

* [Punto1](https://github.com/jimmymoto/appgate/appgate-vpc-jaime-martinez.tf) - Creación VPC
* [Punto2](https://github.com/jimmymoto/appgate/appgate-instance-jaime-martinez.tf) - Creación instancia, creación volumen y adición volumen --Línea 59-111--.
* [Punto3](https://github.com/jimmymoto/appgate/appgate-instance-jaime-martinez.tf) - Despliegue instancia y ejecución script Apache web por docker --Línea 77-111--.
* [Punto3.1](https://github.com/jimmymoto/appgate/utils/docker-compose.yml) - Archivo con imagen docker para despliegue
* [Punto4](https://github.com/jimmymoto/appgate/scripts/tf-appgate-instance-web-script.sh) - Script despliegue Apache web server por docker
* [Punto5](https://github.com/jimmymoto/appgate/appgate-instance-jaime-martinez.tf) - Creación segunda instancia para load balancer --Línea 33-57--.
* [Punto6](https://github.com/jimmymoto/appgate/appgate-instance-jaime-martinez.tf) - Copia script y ejecución --Línea 45-54--.
* [Punto6a](https://github.com/jimmymoto/appgate/scripts/tf-appgate-balanceador-script.sh) - Script despliegue balanceador
* [Punto6b](https://github.com/jimmymoto/appgate/utils/docker-compose.yml) - Archivo que carga unicamente el puerto 80 por el cual es publicado a la imagen de docker.
* [Punto6c](https://github.com/jimmymoto/appgate/html) - Directorio de archivos del servidor web apache, donde se encuentra solucionado este punto.