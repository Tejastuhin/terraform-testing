output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.web.id
}

output "instance_private_ip" {
  value = aws_instance.server.private_ip
}

output "instance_public_ip" {
  value = aws_instance.server.public_ip
}