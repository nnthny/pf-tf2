##  Architecture Overview

```
us-east-1 and us-west-1:
VPC
public Subnets EC2 Instance 
private Subnets RDS MySQL
Internet and NAT Gateways
```

## Folder Structure

```

backend.tf
main.tf
providers.tf
variables.tf
terraform.tfvars
modules
  compute
  database
  network
.gitignore
```

##  Setup

```
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

##  Troubleshooting

had an issue where my keypair was only created in one region and fixed that by creating it in the other region
was commiting my `.terraform/` which was over 300mb and was causing issues and i fixed that by adding it to my gitignore

## added notes

`.gitignore` excludes `.terraform/`, `*.tfvars`, and state files which was also something that needed troubleshooting
