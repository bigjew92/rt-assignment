# ----------------------------
# RT Infrastructure Assignment
# ----------------------------

#-----------------------------
# Provider
#-----------------------------

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  version    = "~> 2.0"
}

#-----------------------------
# Austo Scaling Group -- attach to ELB here
#-----------------------------

resource "aws_autoscaling_group" "rt_infra_asg" {
  name                 = var.asg_name
  max_size             = var.max_size
  min_size             = var.min_size
  launch_configuration = aws_launch_configuration.rt_infra_lc.id
  availability_zones   = var.availability_zones
  load_balancers       = [aws_elb.rt_infra_elb.name]
  health_check_type    = "ELB"
  min_elb_capacity     = var.min_size
}

#-----------------------------
# Launch Configuration
#-----------------------------


data "template_file" "user_data" {
  template = "${file("nginx.tpl")}"
}

resource "aws_launch_configuration" "rt_infra_lc" {
  name            = var.lc_name
  image_id        = var.image_id
  instance_type   = var.instance_type
  user_data       = data.template_file.user_data.rendered
  security_groups = [aws_security_group.rt_infra_sg.id]
}

#-----------------------------
# Security Groups
#-----------------------------

resource "aws_security_group" "rt_infra_sg" {
  name        = var.sg_name
  description = "RT Infra SG"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "rt_infra_sg_allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rt_infra_sg.id
}

resource "aws_security_group_rule" "rt_infra_sg_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rt_infra_sg.id
}

# #-----------------------------
# # Elastic Load Balancer
# #-----------------------------

resource "aws_elb" "rt_infra_elb" {
  name               = "rt-infra-elb"
  internal           = false
  security_groups    = [aws_security_group.rt_infra_sg.id]
  availability_zones = var.availability_zones
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }
}