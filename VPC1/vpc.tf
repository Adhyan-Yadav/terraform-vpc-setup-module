module "webserver_vpc" {
  source = "../modules/vpc"

  # Passing values from root module to terrafom (project) module
  region = var.region

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  availability_zone_private = var.availability_zone_private
  availability_zone_public  = var.availability_zone_public
  destination_cidr_block    = var.destination_cidr_block
  vpc_name= var.vpc_name

}
