resource "aws_s3_bucket" "my_bucket" {
    bucket = "vpc-state-bucket"
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = "my_bucket"
  acl    = "private"
}


resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration{
        status = "Enabled"
    }
}