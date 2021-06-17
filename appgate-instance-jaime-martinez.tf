#Inicialización aws
provider "aws" {
    access_key = "${var.appgate_aws_access_key}"
    secret_key = "${var.appgate_aws_secret_key}"
    region = "${var.appgate_aws_region}"
}

#Creacion Grupo seguridad
resource "aws_security_group" "appgate_security_group" {
    name = "appgate_security_group"
    description = "Grupo seguridad necesario"
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#Creacion balanceador de carga
resource "aws_instance" "appgate_load_balancer" {
    instance_type = "${var.appgate_instance_type}"
    ami = "${var.appgate_aws_centos_ami}"
    security_groups = ["${aws_security_group.appgate_security_group.name}"]
    #conexión ssh
    connection {
        user = "centos"
        key_file = "${var.appgate_aws_pem_key_file_path}"
    }
    key_name = "${var.appgate_aws_key_name}"
    count = 1
    #Copia script de creacion configuracion balanceador
    provisioner "file" {
        source = "scripts/tf-appgate-balanceador-script.sh"
        destination = "/tmp/tf-appgate-balanceador-script.sh"
    }
    #Ejecucion script configuracion balanceador
    provisioner "remote-exec" {
        inline = [
          "sleep 420",
          "chmod +x /tmp/tf-appgate-balanceador-script.sh",
          "sudo /tmp/tf-appgate-balanceador-script.sh"
        ]
    }
}

#Creación volumen
resource "aws_ebs_volume" "appgate_volume" {
        availability_zone = "us-west-2a"
        size = 10
        type = "gp2"
        tags = {
                Name = "appgate-volume"
        }
}

#Montaje volumen en instancia
resource "aws_volume_attachment" "appgate-volume-attach" {
        device_name = "/data_test"
        volume_id   = aws_ebs_volume.appgate_volume.id
        instance_id = aws_instance.appgate_instance_web.id
}

#Creacion instancia web
resource "aws_instance" "appgate_instance_web" {
    instance_type = "${var.appgate_instance_type}"
    ami = "${var.appgate_aws_centos_ami}"
    security_groups = ["${aws_security_group.appgate_security_group.name}"]
    #conexión ssh
    connection {
        user = "centos"
        key_file = "${var.appgate_aws_pem_key_file_path}"
    }
    key_name = "${var.appgate_aws_key_name}"
    count = 1
    #Copia script de creacion instancia web
    provisioner "file" {
        source = "scripts/tf-appgate-instance-web-script.sh"
        destination = "/tmp/tf-appgate-instance-web-script.sh"
    }
    #Copiamos el archivo docker-compose
    provisioner "file" {
        source = "utils/docker-compose.yml"
        destination = "/tmp/docker-compose.yml"
    }
    #Copiamos el directorio html
    provisioner "file" {
        source = "html/"
        destination = "/home/centos/"
    }
    #Ejecucion script configuracion instancia web
    provisioner "remote-exec" {
        inline = [
          "sleep 420",
          "chmod +x /tmp/tf-appgate-instance-web-script.sh",
          "sudo /tmp/tf-appgate-instance-web-script.sh 1"
        ]
    }
}
