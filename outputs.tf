output "instance_ids" {
  description = "IDs of created EC2 instances"
  value       = aws_instance.demo[*].id
}

output "public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = aws_instance.demo[*].public_ip
}