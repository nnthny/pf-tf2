variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}

variable "db_username" {
  description = "RDS Username"
  type        = string
}

variable "db_password" {
  description = "RDS Password"
  type        = string
  sensitive   = true
}