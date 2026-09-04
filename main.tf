terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "tejas-tf-testing"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "web_server" {
  source        = "./modules/web_server"
  instance_type = var.instance_type
}

moved {
  from = aws_vpc.main
  to   = module.web_server.aws_vpc.main
}

moved {
  from = aws_internet_gateway.main
  to   = module.web_server.aws_internet_gateway.main
}

moved {
  from = aws_route_table.public
  to   = module.web_server.aws_route_table.public
}

moved {
  from = aws_route_table_association.web
  to   = module.web_server.aws_route_table_association.web
}

moved {
  from = aws_security_group.web
  to   = module.web_server.aws_security_group.web
}

moved {
  from = aws_subnet.web
  to   = module.web_server.aws_subnet.web
}

moved {
  from = aws_instance.server
  to   = module.web_server.aws_instance.server
}