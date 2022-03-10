variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "AWS region"
}

variable "aws_iam_role" {
  type        = string
  default     = "bootstrap-VM-S3-role"
  description = "Bootstrap IAM role name"
}

variable "aws_iam_policy" {
  type        = string
  default     = "bootstrap-VM-S3-policy"
  description = "Bootstrap IAM policy"
}

variable "bootstrap_bucket" {
  type        = string
  default     = "pan-bootstrap-bucket"
  description = "Bootstrap S3 bucket name"
}