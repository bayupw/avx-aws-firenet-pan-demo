variable "supernet" {
  type    = string
  default = "10.1.0.0/16"
}

variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "AWS region"
}

variable "az1" {
  description = "first az suffix"
  type        = string
  default     = "a"
}

variable "az2" {
  description = "second az suffix"
  type        = string
  default     = "b"
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

variable "aws_account" {
  type        = string
  description = "AWS access account"
}

variable "firenet_vpc" {
  type        = string
  default     = "firenet-vpc"
  description = "Firenet VPC name"
}

variable "firenet_vpc_cidr" {
  type        = string
  default     = "10.0.0.0/23"
  description = "Firenet VPC CIDR block size"
}

variable "firenet_gw" {
  type        = string
  default     = "firenet-gw"
  description = "Firenet gateway name"
}

variable "firenet_gw_size" {
  type        = string
  default     = "c5.xlarge"
  description = "Transit firenet gateway size"
}

variable "fw_instance_name" {
  type        = string
  default     = "fw-instance"
  description = "Firewall instance name"
}

variable "fw_instance_size" {
  type        = string
  default     = "m5.xlarge"
  description = "Firewall instance size"
}

variable "enable_gwlb" {
  type        = bool
  default     = false
  description = "Enable AWS Gateway Load Balancer"
}

variable "gw_instance_size" {
  type        = string
  default     = "t2.micro" #hpe "c5.xlarge"
  description = "AWS gateway instance size"
}

variable "ha_gw" {
  type        = bool
  default     = false
  description = "Enable HA gateway"
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS EC2 Options
# ---------------------------------------------------------------------------------------------------------------------
variable "vm_admin_password" {
  type        = string
  default     = "Aviatrix123#"
  description = "VM admin password"
}

locals {
  az1 = "${var.aws_region}${var.az1}"
  az2 = "${var.aws_region}${var.az2}"
}