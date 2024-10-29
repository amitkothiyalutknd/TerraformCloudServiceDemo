terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  # Configuration options
  # region = "us-east-1"
  region = var.region
}

resource "random_id" "randID" {
  byte_length = 10
}

resource "aws_s3_bucket" "tfBucket" {
  bucket = "tf-loud-${terraform.workspace}-${random_id.randID.hex}"
}

# resource "aws_s3_bucket" "bucketData" {
#   bucket = aws_s3_bucket.demoBucket.bucket
#   source = "./mygoal.txt"
#   key    = "mygoal.txt"
# }

# output "" {
#   value = random_id.randID.hex
# }

#terraform import resource_name.destination_name   source_name
