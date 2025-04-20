terraform {
    backend "s3" {
        bucket= "vpc-state-bucket"
        key = "us-east-1/web-server/terraform.tfstate"
        region = "us-east-1"
    }
}



# This is backend block that sets the remote s3 backend to store the state file of the resource. Correspodnig configuration is under /BACKEND