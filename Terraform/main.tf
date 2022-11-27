resource "aws_s3_bucket" "acme-edgar" {
  bucket = var.bucket-name
  }

  resource "aws_s3_bucket_acl" "acme-edgar" {
    bucket = var.bucket-name
    acl    = "public-read"
  }





