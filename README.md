# Aviatrix Firenet Palo Alto Networks on AWS Demo

The code provided is for demo purposes only.

![Aviatrix Firenet Palo Alto Networks on AWS Demo Topology](images/avx-aws-firenet-pan-demo.png "Aviatrix Firenet Palo Alto Networks on AWS Demo Topology")

Password hash for API (admin-api user) is generated via the "request password-hash" CLI command.
https://knowledgebase.paloaltonetworks.com/KCSArticleDetail?id=kA10g000000PPkCCAW

## Prerequisites

Please make sure you have:
- Aviatrix Controller 6.6
- AWS access accounts are onboarded. 

## Environment Variables

To run this project, you will need to set the following environment variables

Variables | Description
--- | ---
AVIATRIX_CONTROLLER_IP | Aviatrix Controller IP or FQDN 
AVIATRIX_USERNAME | Aviatrix Controller Username
AVIATRIX_PASSWORD | Aviatrix Controller Password
TF_VAR_aws_account | AWS Aviatrix Account 
AWS_ACCESS_KEY_ID | AWS Access Key
AWS_SECRET_ACCESS_KEY | AWS Secret Access Key
AWS_DEFAULT_REGION | AWS Default Region

## Run Locally

Clone the project

```bash
git clone https://github.com/bayupw/avx-aws-firenet-pan-demo
```

Go to the project directory

```bash
cd avx-aws-firenet-pan-demo
```

Set environment variables

```bash
export AVIATRIX_CONTROLLER_IP="aviatrixcontroller.aviatrix.lab"
export AVIATRIX_USERNAME="admin"
export AVIATRIX_PASSWORD="aviatrix123"
export TF_VAR_aws_account="aws-account"
export AWS_ACCESS_KEY_ID="A1b2C3d4E5"
export AWS_SECRET_ACCESS_KEY="A1b2C3d4E5"
export AWS_DEFAULT_REGION="ap-southeast-2"
```

Optional environment variables

```bash
export TF_VAR_enable_gwlb=true
```

Terraform workflow

```bash
terraform init
terraform plan
terraform apply -auto-approve
```
## Inputs

| Name | Description | Default | Required |
|------|-------------|---------|----------|
| supernet | AWS Region | `10.1.0.0/16` | no |
| aws_region | AWS Region | `ap-southeast-2` | no |
| aws_iam_role | Bootstrap IAM role name | `bootstrap-VM-S3-role` | no |
| aws_iam_policy | Bootstrap IAM policy | `bootstrap-VM-S3-policy` | no |
| bootstrap_bucket | Bootstrap S3 bucket name | `pan-bootstrap-bucket` | no |
| aws_account | AWS Account for Aviatrix Controller | `aws-account` | yes |
| firenet_vpc | Firenet VPC name | `pan-firenet-vpc` | no |
| spoke1_vpc | Firenet VPC name | `pan-spoke1-vpc` | no |
| firenet_vpc | Firenet VPC name | `pan-spoke2-vpc` | no |
| spoke2_vpc | Firenet gateway name | `pan-firenet-gw` | no |
| firenet_gw_size | Transit firenet gateway size | `c5.xlarge` | no |
| fw_instance_name | Firewall instance name | `pan-fw-instance` | no |
| fw_instance_size | Firewall instance size | `m5.xlarge` | no |
| gw_instance_size | AWS gateway instance size | `t2.miro` | no |
| enable_gwlb | Enable AWS Gateway Load Balancer | `false` | no |
| ha_gw | Enable HA gateway | `false` | no |
| key_name | Existing SSH public key name | `null` | no |