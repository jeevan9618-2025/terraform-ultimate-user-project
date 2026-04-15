provider "aws" {
  region  = "ap-south-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "demo-tfm-eks-state-s3-bucket-jeevan"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "tf-eks-state-s3-bucket-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
