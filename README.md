# Appgate 

A continuaci贸n se describe el desarrollo realizado para Appgate

## Comenzando 馃殌

_Estas instrucciones te permitir谩n obtener una copia del proyecto y teniendo las credeciales con permisos en aws, poder ejecutar el c贸digo de terraform._

### Pre-requisitos 馃搵

_Como requisitos es necesario tener instalado terraform en el equipo, clonar este repositorio y contar con:_

```
1. Una llave pem.
2. Un AWS access key
3. Un AWS secret key
```

### Instalaci贸n 馃敡

_Para realizar la instalaci贸n, ejecuci贸n y teniendo los prerequisitos, se debe realizar:_

_Cambiar variables en archivo terraform.tfvars_

```
appgate_aws_pem_key = "archivo_pem.pem"
appgate_aws_key_name = "archivo_pem"
appgate_aws_access_key = "aws_access_key"
appgate_aws_secret_key = "aws_secret_key"
```

_luego de esto dar el comando de terraform para ejecuci贸n_

```
terraform apply
```

## Explicaci贸n punto por punto 馃洜锔?

_A continuaci贸n se explica la ubicaci贸n del c贸digo por cada punto solicitado_

* [Punto1](https://github.com/jimmymoto/appgate/blob/master/appgate-vpc-jaime-martinez.tf) - Creaci贸n VPC
* [Punto2](https://github.com/jimmymoto/appgate/blob/master/appgate-instance-jaime-martinez.tf) - Creaci贸n instancia, creaci贸n volumen y adici贸n volumen --L铆nea 59-111--.
* [Punto3](https://github.com/jimmymoto/appgate/blob/master/appgate-instance-jaime-martinez.tf) - Despliegue instancia y ejecuci贸n script Apache web por docker --L铆nea 77-111--.
* [Punto3.1](https://github.com/jimmymoto/appgate/blob/master/utils/docker-compose.yml) - Archivo con imagen docker para despliegue
* [Punto4](https://github.com/jimmymoto/appgate/blob/master/scripts/tf-appgate-instance-web-script.sh) - Script despliegue Apache web server por docker
* [Punto5](https://github.com/jimmymoto/appgate/blob/master/appgate-instance-jaime-martinez.tf) - Creaci贸n segunda instancia para load balancer --L铆nea 33-57--.
* [Punto6](https://github.com/jimmymoto/appgate/blob/master/appgate-instance-jaime-martinez.tf) - Copia script y ejecuci贸n --L铆nea 45-54--.
* [Punto6a](https://github.com/jimmymoto/appgate/blob/master/scripts/tf-appgate-balanceador-script.sh) - Script despliegue balanceador
* [Punto6b](https://github.com/jimmymoto/appgate/blob/master/utils/docker-compose.yml) - Archivo que carga unicamente el puerto 80 por el cual es publicado a la imagen de docker.
* [Punto6c](https://github.com/jimmymoto/appgate/tree/master/html) - Directorio de archivos del servidor web apache, donde se encuentra solucionado este punto.