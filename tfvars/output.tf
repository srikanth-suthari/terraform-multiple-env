# output "remote-instance-ip" {
#     value = aws_instance.ec2_instance.public_ip
# }

output "instance_public_ips_splat" {
  description = "List of public IP addresses using splat syntax"
  value       = aws_instance.web[*].public_ip
}