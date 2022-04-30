terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }

  backend "s3" {
    bucket          = "dev-tf-bucket-30422" //S3 Bucket Name
    key             = "tf/terraform.tfstate"
    region          = "ap-southeast-3"
    encrypt         = "true"
    dynamodb_table  = "tf_state_lock" //DynamoDB Table Name    
  }
}
