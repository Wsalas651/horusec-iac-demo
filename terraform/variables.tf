variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-example-bucket-horusec-demo"
}

variable "environment" {
  description = "Environment for tagging"
  type        = string
  default     = "dev"
}
