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
}

variable "availability_zones" {
  description = "Availabilitiy zones to be used"
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}