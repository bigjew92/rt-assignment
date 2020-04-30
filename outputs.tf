output "rt_infra_elb_dns_name" {
  description = "DNS name of ELB"
  value       = aws_elb.rt_infra_elb.dns_name
}