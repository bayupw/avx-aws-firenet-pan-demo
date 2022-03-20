terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = ">=3.1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "2.21.1-6.6.ga"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "aviatrix" {
  # Configuration options
}