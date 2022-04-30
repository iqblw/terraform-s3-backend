resource "aws_s3_bucket" "tf_state" {
  bucket = "my-bucket-30422" 
  force_destroy = false
}
