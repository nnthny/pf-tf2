variable "db_username" { type = string }
variable "db_password" { type = string }
variable "region" { type = string }
variable "subnet_ids" {
  type = list(string)
}