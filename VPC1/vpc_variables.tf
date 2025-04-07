variable "region" {
  description = "region for deploying the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone_private" {
  description = "availability_zone_private"
  type        = string
}

variable "availability_zone_public" {
  description = "availability_zone_public"
  type        = string
}

variable "destination_cidr_block" {
  description = "destination_cidr_block"
  type        = string
}

variable "vpc_name"{}