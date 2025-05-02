terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name             = "mydb"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  skip_final_snapshot  = true
  publicly_accessible  = false
  storage_encrypted    = true
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "main-subnet-group"
  subnet_ids = var.subnet_ids
}