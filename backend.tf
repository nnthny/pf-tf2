terraform {
  backend "s3" {
    bucket         = "terraform-state-anko2"
    key            = "global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-anko"
    encrypt        = true
  }
}