output "vpc_id" {
  value = module.web_server.vpc_id
}

output "subnet_id" {
  value = module.web_server.subnet_id
}

output "instance_private_ip" {
  value = module.web_server.instance_private_ip
}

output "instance_public_ip" {
  value = module.web_server.instance_public_ip
}