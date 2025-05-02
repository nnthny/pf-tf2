module "network_east" {
  source     = "./modules/network"
  providers  = { aws = aws }
  region     = "us-east-1"
}

module "network_west" {
  source     = "./modules/network"
  providers  = { aws = aws.west }
  region     = "us-west-2"
}

module "compute_east" {
  source     = "./modules/compute"
  providers  = { aws = aws }
  region     = "us-east-1"
  key_name   = var.key_name
  vpc_id     = module.network_east.vpc_id
  subnet_ids = module.network_east.public_subnets

  depends_on = [module.network_east]
}

module "compute_west" {
  source     = "./modules/compute"
  providers  = { aws = aws.west }
  region     = "us-west-2"
  key_name   = var.key_name
  vpc_id     = module.network_west.vpc_id
  subnet_ids = module.network_west.public_subnets

  depends_on = [module.network_west]
}

module "database_east" {
  source       = "./modules/database"
  providers    = { aws = aws }
  region       = "us-east-1"
  subnet_ids   = module.network_east.private_subnets
  db_username  = var.db_username
  db_password  = var.db_password
}

module "database_west" {
  source       = "./modules/database"
  providers    = { aws = aws.west }
  region       = "us-west-2"
  subnet_ids   = module.network_west.private_subnets
  db_username  = var.db_username
  db_password  = var.db_password
}