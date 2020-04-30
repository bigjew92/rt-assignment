#-----------------------------
# Variables
#-----------------------------
variable "aws_access_key" {
  description = "Access key to authenticate to aws account"
}

variable "aws_secret_key" {
  description = "Secret key to authenticate to aws account"
}

variable "region" {
  description = "Region to place infrastructure"
  default     = "us-west-2"
}

variable "asg_name" {
  description = "Name of ASG"
  default     = "rt-infra-asg"
}

variable "max_size" {
  description = "Max amount of instances desired"
  default     = "1"
}

variable "min_size" {
  description = "Min amount of instances desired"
  default     = "1"
}

variable "lc_name" {
  description = "Name of Launch Config"
  default     = "rt-infra-lc"
}

variable "image_id" {
  description = "ID of image to use for instances"
  default     = "ami-0d6621c01e8c2de2c"
}

variable "instance_type" {
  description = "Type of instance to use"
  default     = "t2.micro"
}

variable "sg_name" {
  description = "Security Group Name"
  default     = "RT Infra SG"
}

variable "vpc_id" {
  description = "VPC ID to deploy infrastructure into"
  default     = "vpc-44006f3c"
}

variable "subnet_cidr" {
  description = "CIDR of subnet to deploy infra into"
  default     = "172.31.0.0/16"
}

variable "vpc_zone_identifier" {
  description = "Subnet IDs of VPC where instances will be desploy"
  default     = ["subnet-bfd6ccf4", "subnet-909eddbb", "subnet-7bcc0726", "subnet-5645bc2e"]
}

# variable "key_pair"{
#   description = "Key pair to use to SSH into instance"
#   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCu1mLzFR9cajQbYAUAdbUHgioAxK/5+G2/ARGcnH/R5TngbT+nwyDznvDtEtJb+NGnSDlOzJZgg5RhyPsE/k7bVt2bL/cOJiVYJ2BJEdldIsPU3lIkKXX57oJRtC3Fk9ZMROo52yIdu3pwPm4/+9KioJFJ0SMtYO6NCGKJkh9mb4PSJdFKUL2vSr/QXHlLumLkc72Du8oHryQ17kk9wDe9zhmzlAVEZcb2fBbzRgFwGj5xIJk1PliTNEyMZQCTdj0eglV+1sP+J/sh8yeOlG7g+NuPNLgMDFE7vRuP5i984/hgh/FDrNV9laXIpR6BauOT7rAzki3f45wfGtfxsKcZ rt-infra"
# }