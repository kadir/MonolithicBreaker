module "vpc" {
  source = "./vpc"
}

module "eks" {
  source = "./eks"
}

module "rds" {
  source = "./rds"
}
