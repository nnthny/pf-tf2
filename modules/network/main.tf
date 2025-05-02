
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count                   = 2
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count                   = 2
  cidr_block              = "10.0.${count.index + 100}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index + 1]
  vpc_id                  = aws_vpc.main.id
}
