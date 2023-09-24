terraform {
  cloud {
    organization = "TF-web"
    workspaces {
     name = "devops-aws-web-dev"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}


resource "aws_instance" "webserver" {
	ami = var.ami
        instance_type = "t2.small"
        tags = {
           Name = var.environ
}
}

output "Public_ip" {
    value = aws_instance.webserver.public_ip
}



provider "aws" {
	region = "ap-south-1"
}
variable instance_type {
   type = string
}

variable ami {
  type = string
}

variable environ {
  type = string
}

