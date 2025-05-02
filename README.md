# Multi-Region AWS Two-Tier Architecture with Terraform

## Overview
This project deploys a two-tier web+database architecture across `us-east-1` and `us-west-2` using Terraform.
- EC2 web servers in public subnets
- RDS MySQL in private subnets
- Remote state in encrypted S3 bucket with DynamoDB locking

## Structure
- `modules/network` - VPC, public/private subnets
- `modules/compute` - EC2 web server with HTTP access
- `modules/database` - RDS MySQL with encryption
- `main.tf`, `providers.tf`, etc. in root orchestrate everything
- Make sure to provide `key_name`, `db_username`, `db_password` via tfvars or CLI
