#Tipo Instancia
variable "appgate_instance_type" {
  default = "t3.micro"
}

#Ami Instancia Centos 7.9.2009 region oregon (us-west-2)
variable "appgate_aws_centos_ami" {
  default = "ami-0686851c4e7b1a8e1"
}

#Region
variable "appgate_aws_region" {
  default = "us-west-2"
}

#Pem key de conexión a instancias
variable "appgate_aws_pem_key" {}

#Nombre pem key conexión a instancias
variable "appgate_aws_key_name" {}

#Key aws
variable "appgate_aws_access_key" {}

#Secret aws
variable "appgate_aws_secret_key" {}