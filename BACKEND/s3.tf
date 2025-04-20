resource "aws_s3_bucket" "my_bucket" {
  bucket = "vpc-state-bucket"
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


#this is resource configuration block to create s3 resource and use it as remote backend to store the state file