# Rooster Teeth Infrastructure Assignment

## Purpose

The prupose of this project is to "Launch an auto-scaled service in Amazon's Virtual Private Cloud." The infrastructure behind this includes an Autoscaling Group, a Launch Configuration, a Security Group, and an Elastic Load Balancer. 

This service is provisioned with a simple HTML page backed by nginx. If an instance in the autoscaling group is terminated or goes down for whatever reason, a new instance will be put in its place. There is a monitor to check the CPU Utilization of the instances periodically. If this check finds that an instance is using above 40% of CPU, it will spin up a new instance. Once the CPU utilization goes down, the new instances created to help take some of the load will also be shut down.

## Usage

### Creating resources

To use please clone repository. 

Initialize the directory with the following command:

```bash
terraform init
```

There are a few different way in which this can be run. 

1. Supply a `.tfvars` file with the following (preferred method to keep sensitive data private):
 - aws\_access_key
 - aws\_secret_key
 - vpc_id

Run the following:
```bash
terraform apply
```


2. Supply the following via command line arguments:
 - aws\_access_key
 - aws\_secret_key
 - vpc_id

Run the following:
```bash
terraform apply \
    -var 'aws_access_key=AWS_ACCESS_KEY' \
    -var 'aws_secret_key=AWS_SECRET_KEY' \
    -var 'vpc_id=VPC_ID'
```
### Destroying resources
```bash
terraform destroy
```

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| asg\_name | Name of ASG | `string` | `"rt-infra-asg"` | no |
| availability\_zones | Availabilitiy zones to be used | `list` | <pre>[<br>  "us-west-2a",<br>  "us-west-2b",<br>  "us-west-2c"<br>]</pre> | no |
| aws\_access\_key | Access key to authenticate to aws account | `any` | n/a | yes |
| aws\_secret\_key | Secret key to authenticate to aws account | `any` | n/a | yes |
| image\_id | ID of image to use for instances | `string` | `"ami-0d6621c01e8c2de2c"` | no |
| instance\_type | Type of instance to use | `string` | `"t2.micro"` | no |
| lc\_name | Name of Launch Config | `string` | `"rt-infra-lc"` | no |
| max\_size | Max amount of instances desired | `string` | `"4"` | no |
| min\_size | Min amount of instances desired | `string` | `"2"` | no |
| region | Region to place infrastructure | `string` | `"us-west-2"` | no |
| sg\_name | Security Group Name | `string` | `"RT Infra SG"` | no |
| tags | Default tags to have on pieces of infrastructure | `list` | <pre>[<br>  {<br>    "key": "environment",<br>    "propagate_at_launch": true,<br>    "value": "dev"<br>  },<br>  {<br>    "key": "project",<br>    "propagate_at_launch": true,<br>    "value": "rt_infrastructure_assignment"<br>  },<br>  {<br>    "key": "creator",<br>    "propagate_at_launch": true,<br>    "value": "alex_simon"<br>  },<br>  {<br>    "key": "requestor",<br>    "propagate_at_launch": true,<br>    "value": "ben_and_dehron"<br>  }<br>]</pre> | no |
| vpc\_id | VPC ID to deploy infrastructure into | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| rt\_infra\_elb\_dns\_name | DNS name of ELB |

