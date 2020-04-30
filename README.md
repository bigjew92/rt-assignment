# Rooster Teeth Infrastructure Assignment

To run, clone repo and supply

- AWS Access Key and AWS Secret Key.
- VPC ID
- List of Subnets within VPC

Edit or pass any other variables desired

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
| aws\_access\_key | Access key to authenticate to aws account | `any` | n/a | yes |
| aws\_secret\_key | Secret key to authenticate to aws account | `any` | n/a | yes |
| image\_id | ID of image to use for instances | `string` | `"ami-0d6621c01e8c2de2c"` | no |
| instance\_type | Type of instance to use | `string` | `"t2.micro"` | no |
| lc\_name | Name of Launch Config | `string` | `"rt-infra-lc"` | no |
| max\_size | Max amount of instances desired | `string` | `"1"` | no |
| min\_size | Min amount of instances desired | `string` | `"1"` | no |
| region | Region to place infrastructure | `string` | `"us-west-2"` | no |
| sg\_name | Security Group Name | `string` | `"RT Infra SG"` | no |
| subnet\_cidr | CIDR of subnet to deploy infra into | `string` | `"172.31.0.0/16"` | no |
| vpc\_id | VPC ID to deploy infrastructure into | `string` | `"vpc-44006f3c"` | no |
| vpc\_zone\_identifier | Subnet IDs of VPC where instances will be desploy | `list` | <pre>[<br>  "subnet-bfd6ccf4",<br>  "subnet-909eddbb",<br>  "subnet-7bcc0726",<br>  "subnet-5645bc2e"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| rt\_infra\_sg\_id | n/a |

