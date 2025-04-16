# backend.tf (root module)
terraform {
  backend "s3" {
    bucket = "vpc-state-bucket"
    key    = "us-east-1/vpc1/terraform.tfstate"
    region = "us-east-1"
  }
}
