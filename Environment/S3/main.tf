#Create S3 Bucket
resource "aws_s3_bucket" "tf_state" {
  bucket = "dev-tf-bucket-30422"
  force_destroy = false
  tags = {
    Name        = "terraform-state"
    Environment = "Development"
  }
}

#Define Bucket Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#Enable S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

#Create DynamoDB Table
resource "aws_dynamodb_table" "tf-state-lock" {
    name           = "tf_state_lock"
    read_capacity  = 10
    write_capacity = 10
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
    Name        = "terraform-state"
    Environment = "Development"        
    }
}
