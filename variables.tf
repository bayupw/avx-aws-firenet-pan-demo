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

variable "config_version" {
  type        = string
  default     = "10.1.0"
  description = "Config version"
}

variable "detail_version" {
  type        = string
  default     = "10.1.3"
  description = "Detail version"
}

variable "admin_user" {
  type        = string
  default     = "admin"
  description = "VM-Series admin username"
}

variable "admin_password_phash" {
  type        = string
  default     = "$5$rpbkrfyo$AuahwOgZREF65jNMQpkFW.fFHX0RGbOhLLGsdY7nL/."
  description = "VM-Series admin password phash"
}

variable "admin_public_key" {
  type        = string
  default     = "c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCQVFDZzkrT293MlpUVkcxaW01RjBwbE83aFVETlZnRVNZOFNBMThEOUVxWVR1Q3ZobGs3eVIwenBjTEJMNGVmMU02dDJubDZ5SWp0VytlZFhqV0VvTFA3SjRTbHljbjF6RWNBQm93TWVVM00yMFBOTFFMUWdKTlI2QnNsSTBpc1B5U1Yrc092amVYWjlGVFZKMTZrUXhNZjdPTUkzT1ozellNOEsvd0VVcDg5SmFjZmdBMTZHZHN2SWo2dy9lUzZLaVZQbVRWWlNTZmVOendMRGluNDRVbElvcUx5ZkVqS0NQcTUzb0prcyttVSt4eVhsbk9XZVN2Y2FiZ0U1WUJtVy9oamU1QTFOc29WL2s0ellzMzlROXNiODJ0TjhXSkJYN014bWpzUitYMFNaeU8vRWNtNmk1amxpSHB0c256MTRWcDVmTmFXZDJQVUYzNmxlOFdQSStWcXQgdnBjLTBmNjYxYTYyZjgxODEzMzM5X2Z3LWluc3RhbmNlLTE="
  description = "VM-Series admin public-key"
}

variable "admin_api_user" {
  type        = string
  default     = "admin-api"
  description = "VM-Series admin API username"
}

variable "admin_api_profile_name" {
  type        = string
  default     = "Aviatrix-API-Role"
  description = "VM-Series admin API profile name"
}

variable "admin_api_password_phash" {
  type        = string
  default     = "$5$wvkrarwn$ySGHsUWRFrKJ6v3nw21sJ842cBkC9CU3k04adOmaY90"
  description = "VM-Series admin API password phash"
}

# Aviatrix123# cleartext for api-admin
variable "admin_api_password_cleartext" {
  type        = string
  default     = "Aviatrix123#"
  description = "VM-Series admin API password cleartext"
}

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

variable "aws_account" {
  type        = string
  default     = "aws-account"
  description = "AWS access account"
}

variable "firenet_vpc" {
  type        = string
  default     = "pan-firenet-vpc"
  description = "Firenet VPC name"
}

variable "spoke1_vpc" {
  type        = string
  default     = "pan-spoke1-vpc"
  description = "Spoke1 VPC name"
}

variable "spoke2_vpc" {
  type        = string
  default     = "pan-spoke2-vpc"
  description = "Spoke2 VPC name"
}

variable "firenet_gw" {
  type        = string
  default     = "pan-firenet-gw"
  description = "Firenet gateway name"
}

variable "firenet_gw_size" {
  type        = string
  default     = "c5.xlarge"
  description = "Transit firenet gateway size"
}

variable "fw_instance_name" {
  type        = string
  default     = "pan-fw-instance"
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

variable "enable_east_west_inspection" {
  type        = bool
  default     = true
  description = "Enable east west inspection"
}

variable "enable_egress" {
  type        = bool
  default     = false
  description = "Enable egress through firewall"
}

variable "wait_bootstrap" {
  type        = string
  default     = "300s"
  description = "Time to wait after the bootstrap is created before launching a firewall instance"
}

variable "wait_fw_instance" {
  type        = string
  default     = "600s"
  description = "Time to wait after the firewall instance is launched"
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