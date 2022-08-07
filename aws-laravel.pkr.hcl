packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "packer-aws-laravel" {
  ami_name      = "packer-aws-laravel-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "packer-aws-laravel"
  sources = [
    "source.amazon-ebs.packer-aws-laravel"
  ]

  provisioner "file" {
    source = "packer-aws-laravel.zip"
    destination = "/home/ubuntu/packer-aws-laravel.zip"
  }

  provisioner "file" {
    source = "./config/nginx.conf"
    destination = "/home/ubuntu/nginx.conf"
  }

  provisioner "shell" {
    script = "./provision/nginx.sh"
  }

  provisioner "shell" {
    script = "./provision/php.sh"
  }

  provisioner "shell" {
    script = "./provision/node.sh"
  }

  provisioner "shell" {
    script = "./provision/laravel.sh"
  }
}
